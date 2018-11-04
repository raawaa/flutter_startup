import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_startup/main.dart';

class TaskList extends StatelessWidget {
  const TaskList({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final taskList = AppData.of(context).taskList;
    return Scaffold(
      appBar: new AppBar(
        title: Text("TaskList"),
      ),
      body: ListView.builder(
          itemCount: taskList.length,
          itemBuilder: (BuildContext context, int i) {
            return new ListTile(
              leading: new Icon(Icons.check_box_outline_blank),
              title: new Text(taskList[i].title),
            );
          }),
      floatingActionButton: new FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () => Navigator.pushNamed(context, '/create')),
    );
  }

//  ListView.builder(
//itemCount: snapshot.data.length,
//itemBuilder: (context, i) {
////                  if (i.isOdd) {
////                    return Divider();
////                  }
////                  final index = i ~/ 2;
////        if (index >= _suggestions.length) {
////          _suggestions.addAll(generateWordPairs().take(10));
////        }
//return _buildRow(snapshot.data[i]);
//});
}
