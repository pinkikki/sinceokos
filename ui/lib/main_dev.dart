import 'package:flutter/material.dart';
import 'package:sinceokos_ui/app_service.dart';
import 'package:sinceokos_ui/pages/home.dart';
import 'package:sinceokos_ui/port/grpc_client.dart';

void main() {
  var configuredApp =
      GrpcContainer(grpc: Grpc("172.19.0.1", 19003), child: MyApp());
  runApp(configuredApp);
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'diaries',
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),
      home: MyHomePage(title: 'Cokos日記'),
    );
  }
}
