import 'package:flutter/material.dart';
import 'package:flutter_startup/models/Task.dart';
import 'package:flutter_startup/task_list.dart';

void main() => runApp(App());

class App extends StatefulWidget {
  // This widget is the root of your application.
  @override
  State<App> createState() => new _AppState();
}

class _AppState extends State<App> {
  List<Task> _taskList = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _taskList.add(new Task('taskA', 'todo taskA'));
    _taskList.add(new Task('taskB', 'todo taskB'));
    _taskList.add(new Task('taskC', 'todo taskC'));
    _taskList.add(new Task('taskD', 'todo taskD'));
  }

  @override
  Widget build(BuildContext context) {
    return AppData(taskList: _taskList, child: MaterialApp(home: TaskList()));
  }
}

class AppData extends InheritedWidget {
  final List<Task> taskList;

  AppData({@required Widget child, @required this.taskList, Key key})
      : super(key: key, child: child);

  static AppData of(BuildContext context) {
    return context.inheritFromWidgetOfExactType(AppData);
  }

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) {
    // TODO: implement updateShouldNotify
    return true;
  }
}
