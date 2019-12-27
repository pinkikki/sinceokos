import 'package:grpc/grpc.dart';

class Grpc {
  ClientChannel client;

  factory Grpc(String host, int port) =>
      Grpc._internal(host, port);

  Grpc._internal(String host, int port) {
    client = ClientChannel(host,
        port: port,
        options: ChannelOptions(
          credentials: ChannelCredentials.insecure(),
          idleTimeout: Duration(minutes: 1),
        ));
  }
}
