import 'package:grpc/grpc.dart';
import 'package:sinceokos_ui/port/diary.pbgrpc.dart';
import 'package:sinceokos_ui/port/google/protobuf/empty.pb.dart';
import 'package:sinceokos_ui/port/grpc_client.dart';

class DiaryService {
  static Future<DiaryResource> get(String id) async {
    var client = DiaryClient(GrpcClientSingleton().client);
    var diaryId = DiaryId.create();
    diaryId.id = id;
    return await client.get(diaryId);
  }

  static Future<DiaryResources> list() async {
    var client = DiaryClient(GrpcClientSingleton().client);
    return await client.list(Empty.create());
  }

  static Future<Empty> save(String title, String text) async {
    var client = DiaryClient(GrpcClientSingleton().client);
    var request = DiaryRequest.create();
    request.title = title;
    request.text = text;
    return await client.save(request);
  }

  static ResponseStream<DiarySnapshot> download(String id) {
    var client = DiaryClient(GrpcClientSingleton().client);
    var dsi = DiarySnapshotId.create();
    dsi.id = id;
    return client.download(dsi);
  }

  static Future<DiaryResource> previous(String id) async {
    var client = DiaryClient(GrpcClientSingleton().client);
    var diaryId = DiaryId.create();
    diaryId.id = id;
    return await client.previous(diaryId);
  }

  static Future<DiaryResource> next(String id) async {
    var client = DiaryClient(GrpcClientSingleton().client);
    var diaryId = DiaryId.create();
    diaryId.id = id;
    return await client.next(diaryId);
  }
}
