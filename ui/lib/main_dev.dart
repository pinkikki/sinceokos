import 'package:flutter/material.dart';
import 'package:sinceokos_ui/app_service.dart';
import 'package:sinceokos_ui/pages/home.dart';
import 'package:sinceokos_ui/port/diary_service.dart';

void main() {
  var configuredApp = AppService(
      diaryService: DiaryService("172.19.0.2", 19003), child: MyApp());
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
