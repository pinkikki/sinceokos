import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sinceokos_ui/app_service.dart';
import 'package:sinceokos_ui/port/diary_service.dart';

class DiaryRegisterPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new _DiaryRegisterState();
}

class _DiaryRegisterState extends State<DiaryRegisterPage> {
  final _formKey = GlobalKey<FormState>();
  String _title;
  String _text;
  DiaryService _diaryService;

  Future<void> _save() async {
    await _diaryService.save(_title, _text);
    Navigator.pop(context);
  }

  Future getImage(ImageSource imageSource) async {
    var image = await ImagePicker.pickImage(source: imageSource);
    _diaryService.upload(image);
  }

  Widget buildImageSelector(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        ListTile(
          leading: Icon(Icons.photo_library),
          title: Text("gallery"),
          onTap: () => getImage(ImageSource.gallery),
        ),
        ListTile(
          leading: Icon(Icons.camera_alt),
          title: Text("camera"),
          onTap: () => getImage(ImageSource.camera),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    _diaryService = DiaryService(GrpcContainer.of(context).grpc);
    return Scaffold(
        appBar: AppBar(
          title: Text("Cokos日記登録"),
          actions: <Widget>[
            IconButton(
              icon: const Icon(Icons.save),
              onPressed: () {
                if (_formKey.currentState.validate()) {
                  _formKey.currentState.save();
                  _save();
                }
              },
            )
          ],
        ),
        body: Form(
            key: _formKey,
            child: ListView(children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
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
                    child: IconButton(
                      icon: const Icon(Icons.camera_alt),
                      onPressed: () => showModalBottomSheet(
                          context: context, builder: buildImageSelector),
                    ),
                  ),
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
                ],
              )
            ])));
  }
}
