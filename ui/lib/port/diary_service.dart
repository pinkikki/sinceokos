import 'package:sinceokos_ui/port/diary.pbgrpc.dart';
import 'package:sinceokos_ui/port/grpc_client.dart';

class DiaryService {
  static Future<DiaryResponse> get() async{
    var client = DiaryClient(GrpcClientSingleton().client);
    var criteria = DiaryCriteria.create();
    criteria.no = "1";
    return await client.get(criteria);
  }
}
