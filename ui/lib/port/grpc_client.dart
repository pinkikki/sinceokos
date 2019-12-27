import 'package:flutter/cupertino.dart';
import 'package:grpc/grpc.dart';

class GrpcClientSingleton {
  ClientChannel client;

  factory GrpcClientSingleton(String host, int port) =>
      GrpcClientSingleton._internal(host, port);

  GrpcClientSingleton._internal(String host, int port) {
    client = ClientChannel(host,
        port: port,
        options: ChannelOptions(
          credentials: ChannelCredentials.insecure(),
          idleTimeout: Duration(minutes: 1),
        ));
  }
}
