///
//  Generated code. Do not modify.
//  source: diary/diary.proto
//
// @dart = 2.3
// ignore_for_file: camel_case_types,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type

import 'dart:async' as $async;

import 'dart:core' as $core;

import 'package:grpc/service_api.dart' as $grpc;
import 'diary.pb.dart' as $0;
export 'diary.pb.dart';

class DiaryClient extends $grpc.Client {
  static final _$get = $grpc.ClientMethod<$0.DiaryCriteria, $0.DiaryResponse>(
      '/Diary/Get',
      ($0.DiaryCriteria value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.DiaryResponse.fromBuffer(value));

  DiaryClient($grpc.ClientChannel channel, {$grpc.CallOptions options})
      : super(channel, options: options);

  $grpc.ResponseFuture<$0.DiaryResponse> get($0.DiaryCriteria request,
      {$grpc.CallOptions options}) {
    final call = $createCall(_$get, $async.Stream.fromIterable([request]),
        options: options);
    return $grpc.ResponseFuture(call);
  }
}

abstract class DiaryServiceBase extends $grpc.Service {
  $core.String get $name => 'Diary';

  DiaryServiceBase() {
    $addMethod($grpc.ServiceMethod<$0.DiaryCriteria, $0.DiaryResponse>(
        'Get',
        get_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.DiaryCriteria.fromBuffer(value),
        ($0.DiaryResponse value) => value.writeToBuffer()));
  }

  $async.Future<$0.DiaryResponse> get_Pre(
      $grpc.ServiceCall call, $async.Future<$0.DiaryCriteria> request) async {
    return get(call, await request);
  }

  $async.Future<$0.DiaryResponse> get(
      $grpc.ServiceCall call, $0.DiaryCriteria request);
}
