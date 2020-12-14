///
//  Generated code. Do not modify.
//  source: temp.proto
//
// @dart = 2.3
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

import 'dart:async' as $async;

import 'dart:core' as $core;

import 'package:grpc/service_api.dart' as $grpc;
import 'google/protobuf/empty.pb.dart' as $0;
import 'temp.pb.dart' as $1;
export 'temp.pb.dart';

class CPUClient extends $grpc.Client {
  static final _$sayTemp = $grpc.ClientMethod<$0.Empty, $1.TempResponse>(
      '/cpu.CPU/sayTemp',
      ($0.Empty value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $1.TempResponse.fromBuffer(value));

  CPUClient($grpc.ClientChannel channel,
      {$grpc.CallOptions options,
      $core.Iterable<$grpc.ClientInterceptor> interceptors})
      : super(channel, options: options, interceptors: interceptors);

  $grpc.ResponseFuture<$1.TempResponse> sayTemp($0.Empty request,
      {$grpc.CallOptions options}) {
    return $createUnaryCall(_$sayTemp, request, options: options);
  }
}

abstract class CPUServiceBase extends $grpc.Service {
  $core.String get $name => 'cpu.CPU';

  CPUServiceBase() {
    $addMethod($grpc.ServiceMethod<$0.Empty, $1.TempResponse>(
        'sayTemp',
        sayTemp_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.Empty.fromBuffer(value),
        ($1.TempResponse value) => value.writeToBuffer()));
  }

  $async.Future<$1.TempResponse> sayTemp_Pre(
      $grpc.ServiceCall call, $async.Future<$0.Empty> request) async {
    return sayTemp(call, await request);
  }

  $async.Future<$1.TempResponse> sayTemp(
      $grpc.ServiceCall call, $0.Empty request);
}
