library temp;

export 'src/temp_base.dart';

import 'package:grpc/grpc.dart';
import 'package:temp/src/generated/temp.pbgrpc.dart';
import 'dart:io';

class CpuService extends CPUServiceBase {
  @override
  Future<TempResponse> sayTemp(ServiceCall call, TempRequest request) async {
    final file = File('/sys/class/thermal/thermal_zone0/temp');
    var contents = await file.readAsString();

    return TempResponse()..count = int.parse(contents)+1000000;
  }
}

Future<void> main(List<String> args) async {
  final server = Server([CpuService()], const <Interceptor>[]);
  await server.serve(port: 50051);
  print('Server listen on port 50051');
}
