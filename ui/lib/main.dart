import 'package:flutter/material.dart';
import 'package:sinceokos_ui/port/diary.pb.dart';
import 'package:sinceokos_ui/port/diary_service.dart';

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
  List<DiaryResource> _diaries = List();

  Future<void> _get() async {
    var response = await DiaryService.list();
    setState(() {
      _diaries = response.diaries;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
//      body: Center(
//        child: Column(
//          mainAxisAlignment: MainAxisAlignment.center,
//          children: <Widget>[
//            Text(
//              'You have pushed the button this many times:',
//            ),
//            Text(
//              '$_text',
//              style: Theme
//                  .of(context)
//                  .textTheme
//                  .display1,
//            ),
//          ],
//        ),
//      ),
      body: ListView.builder(
          itemCount: _diaries.length,
          itemBuilder: (context, index) {
            var diary = _diaries[index];
            return Column(
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Padding(
                          padding:
                              const EdgeInsets.fromLTRB(12.0, 12.0, 12.0, 6.0),
                          child: Text(
                            diary.no,
                            style: TextStyle(
                                fontSize: 22.0, fontWeight: FontWeight.bold),
                          ),
                        ),
                        Padding(
                          padding:
                              const EdgeInsets.fromLTRB(12.0, 6.0, 12.0, 12.0),
                          child: Text(
                            diary.text,
                            style: TextStyle(fontSize: 18.0),
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Text(
                            "5m",
                            style: TextStyle(color: Colors.grey),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Icon(
                              Icons.star_border,
                              size: 35.0,
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Divider(
                  height: 2.0,
                  color: Colors.grey,
                )
              ],
            );
//            return ListTile(
//              leading: Icon(Icons.crop_din),
//              title: Text(diary.no),
//              subtitle: Text(diary.text),
//            );
          }),
      floatingActionButton: FloatingActionButton(
        onPressed: _get,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}
