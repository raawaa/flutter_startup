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
  ListDisplayMode displayMode;
  void addTask(Task task) => taskList.add(task);
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

  @override
  void initState() {
    super.initState();
    taskList.add(new Task(title: 'taskA', content: 'todo taskA'));
    taskList.add(new Task(title: 'taskB', content: 'todo taskB'));
    taskList.add(new Task(title: 'taskC', content: 'todo taskC'));
    taskList.add(new Task(title: 'taskD', content: 'todo taskD'));
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
