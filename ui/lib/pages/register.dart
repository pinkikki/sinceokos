import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sinceokos_ui/port/diary_service.dart';

class DiaryRegisterPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new _DiaryRegisterState();
}

class _DiaryRegisterState extends State<DiaryRegisterPage> {
  final _formKey = GlobalKey<FormState>();
  String _title;
  String _text;

  Future<void> _save() async {
    await DiaryService.save(_title, _text);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Cokos日記登録"),
        ),
        body: Form(
            key: _formKey,
            child: ListView(children: [
              Column(
                children: <Widget>[
                  Container(
                      margin: EdgeInsets.only(left: 10, right: 10),
                      child: TextFormField(
                        onSaved: (value) => _title = value,
                        validator: (value) => value.isEmpty ? "入力して〜" : null,
                        decoration: InputDecoration(labelText: "タイトル入力してね"),
                      )),
                  Container(
                      margin: EdgeInsets.only(left: 10, right: 10),
                      child: TextFormField(
                        maxLines: 20,
                        onSaved: (value) => _text = value,
                        validator: (value) => value.isEmpty ? "入力して〜" : null,
                        decoration: InputDecoration(
                            alignLabelWithHint: true,
                            labelText: "今日のできごと入力してね"),
                      )),
                  RaisedButton(
                    child: Text("save"),
                    onPressed: () {
                      if (_formKey.currentState.validate()) {
                        _formKey.currentState.save();
                        _save();
                      }
                    },
                  )
                ],
              )
            ])));
  }
}
