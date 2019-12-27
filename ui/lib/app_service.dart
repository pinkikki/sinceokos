import 'package:flutter/cupertino.dart';
import 'package:sinceokos_ui/port/diary_service.dart';

class AppService extends InheritedWidget {
  AppService({@required this.diaryService, @required Widget child})
      : super(child: child);

  final DiaryService diaryService;

  static AppService of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<AppService>();
  }

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) {
    return false;
  }
}
