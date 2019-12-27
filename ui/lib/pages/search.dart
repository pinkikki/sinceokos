import 'package:flutter/material.dart';
import 'package:sinceokos_ui/port/diary.pb.dart';
import 'package:sinceokos_ui/port/diary_service.dart';

class DiarySearchDelegate extends SearchDelegate<String> {
  List<DiaryResource> _diaries = List();
  final DiaryService _diaryService;

  DiarySearchDelegate(this._diaryService);

  Future<List<DiaryResource>> _get() async {
    var response = await _diaryService.list();
    return response.diaries;
  }

  Widget buildDiaries(BuildContext context, diaries, selected) {
    List<DiaryResource> filtered =
        _diaries.where((d) => d.text.contains(selected)).toList();
    return ListView.builder(
        itemCount: filtered.length,
        itemBuilder: (context, index) {
          var diary = filtered[index];
          return ListTile(
              onTap: () {
                close(context, diary.id);
              },
              title: Column(
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.fromLTRB(
                                12.0, 12.0, 12.0, 6.0),
                            child: Text(
                              diary.id,
                              style: TextStyle(
                                  fontSize: 22.0, fontWeight: FontWeight.bold),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(
                                12.0, 6.0, 12.0, 12.0),
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
                                size: 3.0,
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
              ));
        });
  }

  @override
  List<Widget> buildActions(BuildContext context) {
    return null;
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      tooltip: 'Back',
      icon: AnimatedIcon(
        icon: AnimatedIcons.menu_arrow,
        progress: transitionAnimation,
      ),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return buildDiaries(context, _diaries, query);
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    _get().then((diaries) => _diaries = diaries);
    return Center(
      child: Text(
        'タイトルを入力してください',
        textAlign: TextAlign.center,
      ),
    );
  }
}
