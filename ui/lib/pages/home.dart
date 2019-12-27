import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:sinceokos_ui/app_service.dart';
import 'package:sinceokos_ui/pages/register.dart';
import 'package:sinceokos_ui/pages/search.dart';
import 'package:sinceokos_ui/port/diary.pb.dart';
import 'package:sinceokos_ui/port/diary_service.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  DiarySearchDelegate _delegate;
  DiaryResource _currentDiary;
  Uint8List _images;
  bool _isPreviousDisabled = true;
  bool _isNextDisabled = true;
  DiaryService _diaryService;

  Future<void> _get(selected) async {
    var response = _diaryService.get(selected);
    setState(() {
      _onDiaryResource(response);
    });
  }

  Future<void> _download(selected) async {
    var response = _diaryService.download(selected);
    setState(() {
      var bytes = List<int>();
      response
          .forEach((s) {
            bytes.addAll(s.snapshot);
          })
          .then((t) => _images = Uint8List.fromList(bytes))
          .catchError((e) => _images = null);
    });
  }

  Future<void> _previous() async {
    var response = _diaryService.previous(_currentDiary.id);
    setState(() {
      _onDiaryResource(response);
    });
  }

  Future<void> _next() async {
    var response = _diaryService.next(_currentDiary.id);
    setState(() {
      _onDiaryResource(response);
    });
  }

  Future<void> _onDiaryResource(Future<DiaryResource> response) {
    response.then((v) {
      _download(v.id);
      _currentDiary = v;
      var p = v.previous;
      var n = v.next;
      debugPrint("previous=[$p]");
      debugPrint("next=[$n]");
      _isPreviousDisabled = (v.previous == null || v.previous.isEmpty);
      _isNextDisabled = (v.next == null || v.next.isEmpty);
    }).catchError((e) {
      _currentDiary = null;
      _images = null;
      _isPreviousDisabled = true;
      _isNextDisabled = true;
    });
  }

  Widget buildDiary() {
    if (_currentDiary == null) {
      return Container();
    }
    return Column(children: <Widget>[
      Container(
        decoration:
            BoxDecoration(border: Border.all(color: Colors.black12, width: 2)),
        margin: EdgeInsets.all(10),
        padding: EdgeInsets.all(3),
        child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(_currentDiary.text),
              Text(_currentDiary.id)
            ]),
      ),
      Expanded(
          child: ListView(children: [
        Container(
          decoration: BoxDecoration(
              border: Border.all(color: Colors.black12, width: 2)),
          margin: EdgeInsets.all(10),
          padding: EdgeInsets.all(3),
          child: Row(children: <Widget>[Text(_currentDiary.text)]),
        ),
        buildImage()
      ]))
    ]);
  }

  Widget buildImage() {
    debugPrint(_images.lengthInBytes.toString());
    if (_images != null && _images.isNotEmpty) {
      return Container(child: Image.memory(_images));
    }

    return Container();
  }

  @override
  Widget build(BuildContext context) {
    _diaryService = DiaryService(GrpcContainer.of(context).grpc);
    _delegate = new DiarySearchDelegate(_diaryService);
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () async {
              final String selected = await showSearch<String>(
                context: context,
                delegate: _delegate,
              );
              _currentDiary = null;
              _images = null;
              _get(selected);
            },
          ),
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () => Navigator.push(context,
                MaterialPageRoute(builder: (context) => DiaryRegisterPage())),
          )
        ],
      ),
      body: buildDiary(),
      floatingActionButton:
          Row(mainAxisSize: MainAxisSize.min, children: <Widget>[
        FloatingActionButton(
          heroTag: 'previous',
          onPressed: _isPreviousDisabled ? () {} : _previous,
          backgroundColor: _isPreviousDisabled ? Colors.blueGrey : Colors.teal,
          tooltip: 'Previous',
          child: Icon(Icons.navigate_before),
        ),
        Container(
          margin: EdgeInsets.only(left: 5),
          child: FloatingActionButton(
            heroTag: 'next',
            onPressed: _isNextDisabled ? () {} : _next,
            backgroundColor: _isNextDisabled ? Colors.blueGrey : Colors.teal,
            tooltip: 'Next',
            child: Icon(Icons.navigate_next),
          ),
        )
      ]),
    );
  }
}
