import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'models/app_container.dart';
import 'models/task.dart';
import 'detail.dart';

class TaskList extends StatelessWidget {
  const TaskList({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final taskList = AppStateProvider.of(context).appstate.taskList;
    final displayMode = AppStateProvider.of(context).appstate.displayMode;
    return Scaffold(
      appBar: new AppBar(
        title: Text("TaskList"),
        actions: <Widget>[
          IconButton(
            icon: displayMode == ListDisplayMode.list
                ? Icon(Icons.list)
                : Icon(Icons.grid_on),
            onPressed: () {
              print(AppStateProvider.of(context)
                  .appstate
                  .displayMode
                  .toString()); //TODO: delete debuge
              AppStateProvider.of(context).appstate.toggleViewMode();
            },
          )
        ],
      ),
      body: ListBody(displayMode: displayMode, taskList: taskList),
      floatingActionButton: new FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () => Navigator.pushNamed(context, '/create')),
    );
  }
}

class ListBody extends StatelessWidget {
  final List<Task> taskList;

  final ListDisplayMode displayMode;
  ListBody({this.taskList,this.displayMode});
  @override
  Widget build(BuildContext context) {
    if (displayMode == ListDisplayMode.list) {
      return ListView.builder(
          itemCount: taskList.length,
          itemBuilder: (BuildContext context, int i) {
            return new ListTile(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => Detail(taskList[i])));
              },
              leading: new Icon(Icons.check_box_outline_blank),
              title: new Text(taskList[i].title),
            );
          });
    } else {
      return Column(
        children: taskList.map((Task task) {
          return Card(
            child: Text(task.title),
          );
        }).toList(),
      );
    }
  }
}
