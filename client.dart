import 'package:grpc/grpc.dart';
import 'package:temp/src/generated/temp.pbgrpc.dart';
import 'package:temp/src/generated/temp.pb.dart';

Future<void> main(List<String> args) async {
  final channel = ClientChannel(
    '192.168.88.86',
    port: 50051,
    options: ChannelOptions(
      credentials: ChannelCredentials.insecure(),
    ),
  );
  final stub = CPUClient(channel);
  try {
    final response = await stub.sayTemp(TempRequest()..count = 1);
    print(response.count);
  } catch (e) {
    print('Caught error: $e');
  }
  await channel.shutdown();
}
