import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DiaryRegisterPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new _DiaryRegisterState();
}

class _DiaryRegisterState extends State<DiaryRegisterPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Cokos日記登録"),
        ),
        body: Column(
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(left: 10, right: 10),
                child: TextField(
              decoration: InputDecoration(labelText: "タイトル入力してね"),
            )),
            Container(
                margin: EdgeInsets.only(left: 10, right: 10),
                child: TextField(
              maxLines: 10,
              decoration: InputDecoration(
                  alignLabelWithHint: true, labelText: "今日のできごと入力してね"),
            )),
          ],
        ));
  }
}
