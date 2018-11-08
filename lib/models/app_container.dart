import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_startup/create_task.dart';
import 'package:flutter_startup/detail.dart';
import 'package:flutter_startup/models/task.dart';
import 'package:flutter_startup/task_list.dart';
import 'package:flutter_startup/utils/database_helper.dart';

class App extends StatefulWidget {
  final _dbHelper = new DatabaseHelper();
  // This widget is the root of your application.
  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  List<Task> taskList = [];
  ListDisplayMode displayMode;
  // void addTask(Task task) => taskList.add(task);
  void toggleViewMode() {
    switch (displayMode) {
      case ListDisplayMode.list:
        setState(() {
          displayMode = ListDisplayMode.card;
        });
        break;
      case ListDisplayMode.card:
        setState(() {
          displayMode = ListDisplayMode.list;
        });
        break;
      default:
    }
  }

  Future<void> updateTaskList() async {
    widget._dbHelper.getTasks().then((res) {
      setState(() {
        taskList = res;
      });
    });
  }

  @override
  void initState() {
    super.initState();
    // taskList.add(new Task(title: 'taskA', content: 'todo taskA'));
    // taskList.add(new Task(title: 'taskB', content: 'todo taskB'));
    // taskList.add(new Task(title: 'taskC', content: 'todo taskC'));
    // taskList.add(new Task(title: 'taskD', content: 'todo taskD'));
    var dbclient = widget._dbHelper;
    // taskList = await dbclient.getTasks();

    // TODO: then statement excute after initState!!?
    dbclient.getTasks().then((v) {
      taskList = v;
    });
    displayMode = ListDisplayMode.list;
  }

  @override
  Widget build(BuildContext context) {
    return AppStateProvider(
        appstate: this,
        child: MaterialApp(routes: {
          '/detail': (context) => Detail(null),
          '/create': (context) => CreateTaskPage()
        }, home: TaskList()));
  }
}

class AppStateProvider extends InheritedWidget {
  final _AppState appstate;

  AppStateProvider({@required Widget child, @required this.appstate, Key key})
      : super(key: key, child: child);

  static AppStateProvider of(BuildContext context) {
    return context.inheritFromWidgetOfExactType(AppStateProvider);
  }

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) {
    return true;
  }
}

enum ListDisplayMode { list, card }
