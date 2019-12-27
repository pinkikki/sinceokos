import 'dart:async';
import 'dart:ffi';
import 'dart:io';

import 'package:grpc/grpc.dart';
import 'package:sinceokos_ui/port/diary.pbgrpc.dart';
import 'package:sinceokos_ui/port/google/protobuf/empty.pb.dart';
import 'package:sinceokos_ui/port/grpc_client.dart';

class DiaryService {
  GrpcClientSingleton grpc;

  DiaryService(String grpcServerHost, int grpcServerPort) {
    grpc = GrpcClientSingleton(grpcServerHost, grpcServerPort);
  }

  Future<DiaryResource> get(String id) async {
    var client = DiaryClient(grpc.client);
    var diaryId = DiaryId.create();
    diaryId.id = id;
    return await client.get(diaryId);
  }

  Future<DiaryResources> list() async {
    var client = DiaryClient(grpc.client);
    return await client.list(Empty.create());
  }

  Future<Empty> save(String title, String text) async {
    var client = DiaryClient(grpc.client);
    var request = DiaryRequest.create();
    request.title = title;
    request.text = text;
    return await client.save(request);
  }

  ResponseStream<DiarySnapshot> download(String id) {
    var client = DiaryClient(grpc.client);
    var dsi = DiarySnapshotId.create();
    dsi.id = id;
    return client.download(dsi);
  }

  Future<Void> upload(File file) async {
    var client = DiaryClient(grpc.client);
    var ds = DiarySnapshot.create();
    client.upload(_read(file));
  }

  Stream<DiarySnapshot> _read(File file) async* {
    yield* file.openRead().transform(_toDiarySnapshot());
  }

  StreamTransformer<List<int>, DiarySnapshot> _toDiarySnapshot() {
    return StreamTransformer<List<int>, DiarySnapshot>.fromHandlers(
        handleData: (value, sink) {
      var ds = DiarySnapshot.create();
      ds.snapshot = value;
      sink.add(ds);
    });
  }

  Future<DiaryResource> previous(String id) async {
    var client = DiaryClient(grpc.client);
    var diaryId = DiaryId.create();
    diaryId.id = id;
    return await client.previous(diaryId);
  }

  Future<DiaryResource> next(String id) async {
    var client = DiaryClient(grpc.client);
    var diaryId = DiaryId.create();
    diaryId.id = id;
    return await client.next(diaryId);
  }
}
