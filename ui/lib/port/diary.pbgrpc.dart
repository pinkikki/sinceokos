///
//  Generated code. Do not modify.
//  source: app/diary/diary.proto
//
// @dart = 2.3
// ignore_for_file: camel_case_types,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type

import 'dart:async' as $async;

import 'dart:core' as $core;

import 'package:grpc/service_api.dart' as $grpc;
import 'diary.pb.dart' as $0;
import 'google/protobuf/empty.pb.dart' as $1;
export 'diary.pb.dart';

class DiaryClient extends $grpc.Client {
  static final _$get = $grpc.ClientMethod<$0.DiaryCriteria, $0.DiaryResource>(
      '/Diary/Get',
      ($0.DiaryCriteria value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.DiaryResource.fromBuffer(value));
  static final _$list = $grpc.ClientMethod<$1.Empty, $0.DiaryResources>(
      '/Diary/List',
      ($1.Empty value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.DiaryResources.fromBuffer(value));
  static final _$save = $grpc.ClientMethod<$0.DiaryRequest, $1.Empty>(
      '/Diary/Save',
      ($0.DiaryRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $1.Empty.fromBuffer(value));
  static final _$put = $grpc.ClientMethod<$0.DiaryRequest, $1.Empty>(
      '/Diary/Put',
      ($0.DiaryRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $1.Empty.fromBuffer(value));

  DiaryClient($grpc.ClientChannel channel, {$grpc.CallOptions options})
      : super(channel, options: options);

  $grpc.ResponseFuture<$0.DiaryResource> get($0.DiaryCriteria request,
      {$grpc.CallOptions options}) {
    final call = $createCall(_$get, $async.Stream.fromIterable([request]),
        options: options);
    return $grpc.ResponseFuture(call);
  }

  $grpc.ResponseFuture<$0.DiaryResources> list($1.Empty request,
      {$grpc.CallOptions options}) {
    final call = $createCall(_$list, $async.Stream.fromIterable([request]),
        options: options);
    return $grpc.ResponseFuture(call);
  }

  $grpc.ResponseFuture<$1.Empty> save($0.DiaryRequest request,
      {$grpc.CallOptions options}) {
    final call = $createCall(_$save, $async.Stream.fromIterable([request]),
        options: options);
    return $grpc.ResponseFuture(call);
  }

  $grpc.ResponseFuture<$1.Empty> put($0.DiaryRequest request,
      {$grpc.CallOptions options}) {
    final call = $createCall(_$put, $async.Stream.fromIterable([request]),
        options: options);
    return $grpc.ResponseFuture(call);
  }
}

abstract class DiaryServiceBase extends $grpc.Service {
  $core.String get $name => 'Diary';

  DiaryServiceBase() {
    $addMethod($grpc.ServiceMethod<$0.DiaryCriteria, $0.DiaryResource>(
        'Get',
        get_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.DiaryCriteria.fromBuffer(value),
        ($0.DiaryResource value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$1.Empty, $0.DiaryResources>(
        'List',
        list_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $1.Empty.fromBuffer(value),
        ($0.DiaryResources value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.DiaryRequest, $1.Empty>(
        'Save',
        save_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.DiaryRequest.fromBuffer(value),
        ($1.Empty value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.DiaryRequest, $1.Empty>(
        'Put',
        put_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.DiaryRequest.fromBuffer(value),
        ($1.Empty value) => value.writeToBuffer()));
  }

  $async.Future<$0.DiaryResource> get_Pre(
      $grpc.ServiceCall call, $async.Future<$0.DiaryCriteria> request) async {
    return get(call, await request);
  }

  $async.Future<$0.DiaryResources> list_Pre(
      $grpc.ServiceCall call, $async.Future<$1.Empty> request) async {
    return list(call, await request);
  }

  $async.Future<$1.Empty> save_Pre(
      $grpc.ServiceCall call, $async.Future<$0.DiaryRequest> request) async {
    return save(call, await request);
  }

  $async.Future<$1.Empty> put_Pre(
      $grpc.ServiceCall call, $async.Future<$0.DiaryRequest> request) async {
    return put(call, await request);
  }

  $async.Future<$0.DiaryResource> get(
      $grpc.ServiceCall call, $0.DiaryCriteria request);
  $async.Future<$0.DiaryResources> list(
      $grpc.ServiceCall call, $1.Empty request);
  $async.Future<$1.Empty> save($grpc.ServiceCall call, $0.DiaryRequest request);
  $async.Future<$1.Empty> put($grpc.ServiceCall call, $0.DiaryRequest request);
}
