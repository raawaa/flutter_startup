import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'models/appstate.dart';
import 'detail.dart';

class TaskList extends StatelessWidget {
  const TaskList({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final taskList = AppData.of(context).appstate.taskList;
    return Scaffold(
      appBar: new AppBar(
        title: Text("TaskList"),
      ),
      body: ListView.builder(
          itemCount: taskList.length,
          itemBuilder: (BuildContext context, int i) {
            return new ListTile(
              onTap: () {
                // Navigator.pushNamed(context, '/detail');
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => Detail(taskList[i])));
              },
              leading: new Icon(Icons.check_box_outline_blank),
              title: new Text(taskList[i].title),
              // trailing: FlatButton(
              //     onPressed: () {
              //       // Navigator.pushNamed(context, '/detail');
              //       Navigator.push(
              //           context,
              //           MaterialPageRoute(
              //               builder: (context) => Detail(taskList[i])));
              //     },
              //     child: Icon(Icons.details)),
            );
          }),
      floatingActionButton: new FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () => Navigator.pushNamed(context, '/create')),
    );
  }
}
