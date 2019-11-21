import 'package:flutter/material.dart';
import 'package:sinceokos_ui/port/diary.pb.dart';
import 'package:sinceokos_ui/port/diary_service.dart';
import 'package:sinceokos_ui/search.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'diaries',
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),
      home: MyHomePage(title: 'diaries'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  DiarySearchDelegate _delegate = new DiarySearchDelegate();
  DiaryResource _currentDiary;

  Future<void> _get(selected) async {
    var response = await DiaryService.get(selected);
    setState(() {
      _currentDiary = response;
    });
  }

  Future<void> _next() async {}

  Future<void> _previous() async {}

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
              Text(_currentDiary.no)
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
        )
      ]))
    ]);
  }

  @override
  Widget build(BuildContext context) {
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
              debugPrint(selected);
              _get(selected);
            },
          )
        ],
      ),
      body: buildDiary(),
      floatingActionButton: Row(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
        FloatingActionButton(
          heroTag: 'previous',
          onPressed: _previous,
          tooltip: 'Previous',
          child: Icon(Icons.navigate_before),
        ),
        Container(
          margin: EdgeInsets.only(left: 5),
          child: FloatingActionButton(
            heroTag: 'next',
            onPressed: _next,
            tooltip: 'Next',
            child: Icon(Icons.navigate_next),
          ),
        )
      ]),
    );
  }
}
