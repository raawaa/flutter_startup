import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import '../create_task.dart';
import '../detail.dart';
import '../task_list.dart';
import 'task.dart';

class App extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  List<Task> taskList = [];

  void addTask(Task task) => taskList.add(task);

  @override
  void initState() {
    super.initState();
    taskList.add(new Task(title: 'taskA', content: 'todo taskA'));
    taskList.add(new Task(title: 'taskB', content: 'todo taskB'));
    taskList.add(new Task(title: 'taskC', content: 'todo taskC'));
    taskList.add(new Task(title: 'taskD', content: 'todo taskD'));
  }

  @override
  Widget build(BuildContext context) {
    return AppData(
        appstate: this,
        child: MaterialApp(routes: {
          '/detail': (context) => Detail(null),
          '/create': (context) => CreateTask()
        }, home: TaskList()));
  }
}

class AppData extends InheritedWidget {
  final _AppState appstate;

  AppData({@required Widget child, @required this.appstate, Key key})
      : super(key: key, child: child);

  static AppData of(BuildContext context) {
    return context.inheritFromWidgetOfExactType(AppData);
  }

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) {
    return true;
  }
}
