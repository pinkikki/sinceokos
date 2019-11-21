import 'package:sinceokos_ui/port/diary.pbgrpc.dart';
import 'package:sinceokos_ui/port/google/protobuf/empty.pb.dart';
import 'package:sinceokos_ui/port/grpc_client.dart';

class DiaryService {
  static Future<DiaryResource> get(String no) async {
    var client = DiaryClient(GrpcClientSingleton().client);
    var criteria = DiaryCriteria.create();
    criteria.no = no;
    return await client.get(criteria);
  }

  static Future<DiaryResources> list() async {
    var client = DiaryClient(GrpcClientSingleton().client);
    return await client.list(Empty.create());
  }
}
