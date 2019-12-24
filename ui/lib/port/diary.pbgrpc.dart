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
import './google/protobuf/empty.pb.dart' as $1;
export 'diary.pb.dart';

class DiaryClient extends $grpc.Client {
  static final _$get = $grpc.ClientMethod<$0.DiaryId, $0.DiaryResource>(
      '/Diary/Get',
      ($0.DiaryId value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.DiaryResource.fromBuffer(value));
  static final _$list = $grpc.ClientMethod<$1.Empty, $0.DiaryResources>(
      '/Diary/List',
      ($1.Empty value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.DiaryResources.fromBuffer(value));
  static final _$next = $grpc.ClientMethod<$0.DiaryId, $0.DiaryResource>(
      '/Diary/Next',
      ($0.DiaryId value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.DiaryResource.fromBuffer(value));
  static final _$previous = $grpc.ClientMethod<$0.DiaryId, $0.DiaryResource>(
      '/Diary/Previous',
      ($0.DiaryId value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.DiaryResource.fromBuffer(value));
  static final _$save = $grpc.ClientMethod<$0.DiaryRequest, $1.Empty>(
      '/Diary/Save',
      ($0.DiaryRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $1.Empty.fromBuffer(value));
  static final _$put = $grpc.ClientMethod<$0.DiaryRequest, $1.Empty>(
      '/Diary/Put',
      ($0.DiaryRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $1.Empty.fromBuffer(value));
  static final _$download =
      $grpc.ClientMethod<$0.DiarySnapshotId, $0.DiarySnapshot>(
          '/Diary/Download',
          ($0.DiarySnapshotId value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $0.DiarySnapshot.fromBuffer(value));
  static final _$upload = $grpc.ClientMethod<$0.DiarySnapshot, $1.Empty>(
      '/Diary/Upload',
      ($0.DiarySnapshot value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $1.Empty.fromBuffer(value));

  DiaryClient($grpc.ClientChannel channel, {$grpc.CallOptions options})
      : super(channel, options: options);

  $grpc.ResponseFuture<$0.DiaryResource> get($0.DiaryId request,
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

  $grpc.ResponseFuture<$0.DiaryResource> next($0.DiaryId request,
      {$grpc.CallOptions options}) {
    final call = $createCall(_$next, $async.Stream.fromIterable([request]),
        options: options);
    return $grpc.ResponseFuture(call);
  }

  $grpc.ResponseFuture<$0.DiaryResource> previous($0.DiaryId request,
      {$grpc.CallOptions options}) {
    final call = $createCall(_$previous, $async.Stream.fromIterable([request]),
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

  $grpc.ResponseStream<$0.DiarySnapshot> download($0.DiarySnapshotId request,
      {$grpc.CallOptions options}) {
    final call = $createCall(_$download, $async.Stream.fromIterable([request]),
        options: options);
    return $grpc.ResponseStream(call);
  }

  $grpc.ResponseFuture<$1.Empty> upload($async.Stream<$0.DiarySnapshot> request,
      {$grpc.CallOptions options}) {
    final call = $createCall(_$upload, request, options: options);
    return $grpc.ResponseFuture(call);
  }
}

abstract class DiaryServiceBase extends $grpc.Service {
  $core.String get $name => 'Diary';

  DiaryServiceBase() {
    $addMethod($grpc.ServiceMethod<$0.DiaryId, $0.DiaryResource>(
        'Get',
        get_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.DiaryId.fromBuffer(value),
        ($0.DiaryResource value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$1.Empty, $0.DiaryResources>(
        'List',
        list_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $1.Empty.fromBuffer(value),
        ($0.DiaryResources value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.DiaryId, $0.DiaryResource>(
        'Next',
        next_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.DiaryId.fromBuffer(value),
        ($0.DiaryResource value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.DiaryId, $0.DiaryResource>(
        'Previous',
        previous_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.DiaryId.fromBuffer(value),
        ($0.DiaryResource value) => value.writeToBuffer()));
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
    $addMethod($grpc.ServiceMethod<$0.DiarySnapshotId, $0.DiarySnapshot>(
        'Download',
        download_Pre,
        false,
        true,
        ($core.List<$core.int> value) => $0.DiarySnapshotId.fromBuffer(value),
        ($0.DiarySnapshot value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.DiarySnapshot, $1.Empty>(
        'Upload',
        upload,
        true,
        false,
        ($core.List<$core.int> value) => $0.DiarySnapshot.fromBuffer(value),
        ($1.Empty value) => value.writeToBuffer()));
  }

  $async.Future<$0.DiaryResource> get_Pre(
      $grpc.ServiceCall call, $async.Future<$0.DiaryId> request) async {
    return get(call, await request);
  }

  $async.Future<$0.DiaryResources> list_Pre(
      $grpc.ServiceCall call, $async.Future<$1.Empty> request) async {
    return list(call, await request);
  }

  $async.Future<$0.DiaryResource> next_Pre(
      $grpc.ServiceCall call, $async.Future<$0.DiaryId> request) async {
    return next(call, await request);
  }

  $async.Future<$0.DiaryResource> previous_Pre(
      $grpc.ServiceCall call, $async.Future<$0.DiaryId> request) async {
    return previous(call, await request);
  }

  $async.Future<$1.Empty> save_Pre(
      $grpc.ServiceCall call, $async.Future<$0.DiaryRequest> request) async {
    return save(call, await request);
  }

  $async.Future<$1.Empty> put_Pre(
      $grpc.ServiceCall call, $async.Future<$0.DiaryRequest> request) async {
    return put(call, await request);
  }

  $async.Stream<$0.DiarySnapshot> download_Pre($grpc.ServiceCall call,
      $async.Future<$0.DiarySnapshotId> request) async* {
    yield* download(call, await request);
  }

  $async.Future<$0.DiaryResource> get(
      $grpc.ServiceCall call, $0.DiaryId request);
  $async.Future<$0.DiaryResources> list(
      $grpc.ServiceCall call, $1.Empty request);
  $async.Future<$0.DiaryResource> next(
      $grpc.ServiceCall call, $0.DiaryId request);
  $async.Future<$0.DiaryResource> previous(
      $grpc.ServiceCall call, $0.DiaryId request);
  $async.Future<$1.Empty> save($grpc.ServiceCall call, $0.DiaryRequest request);
  $async.Future<$1.Empty> put($grpc.ServiceCall call, $0.DiaryRequest request);
  $async.Stream<$0.DiarySnapshot> download(
      $grpc.ServiceCall call, $0.DiarySnapshotId request);
  $async.Future<$1.Empty> upload(
      $grpc.ServiceCall call, $async.Stream<$0.DiarySnapshot> request);
}
