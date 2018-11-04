import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'models/appstate.dart';
import 'models/task.dart';

class CreateTask extends StatefulWidget {
//  static final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  final _titleController = TextEditingController();
  final _contentController = TextEditingController();

  @override
  _CreateTaskState createState() => _CreateTaskState();
}

class _CreateTaskState extends State<CreateTask> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
//      key: CreateTask.scaffoldKey,
      appBar: new AppBar(title: new Text('create task')),
      body: Builder(builder: (context) {
        return Form(
//          key: _formKey,
            child: new ListView(
          children: <Widget>[
            new TextFormField(
              controller: widget._titleController,
              keyboardType: TextInputType.text,
              decoration: new InputDecoration(hintText: "title"),
            ),
            new TextFormField(
              controller: widget._contentController,
              keyboardType: TextInputType.multiline,
              decoration: InputDecoration(hintText: 'content'),
            ),
            RaisedButton(
              child: Text('提交'),
              onPressed: () {
                print("task-title: " + widget._titleController.text);
                AppData.of(context).appstate.addTask(Task(
                    title: widget._titleController.text,
                    content: widget._contentController.text));
                Scaffold.of(context).showSnackBar(
                    SnackBar(content: Text('${widget._titleController.text}')));
                Navigator.of(context).pop();
              },
            )
          ],
        ));
      }),
    );
  }

  @override
  void dispose() {
    super.dispose();
    widget._titleController.dispose();
    widget._contentController.dispose();
  }

  @override
  void initState() {
    super.initState();
  }
}
