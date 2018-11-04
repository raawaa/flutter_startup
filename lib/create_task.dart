import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'models/appstate.dart';
import 'models/task.dart';

class CreateTaskPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(title: new Text('create task')),
      body: CreateTaskForm(),
    );
  }
}

class CreateTaskForm extends StatefulWidget {
  final _titleController = TextEditingController();
  final _contentController = TextEditingController();

  @override
  _CreateTaskFormState createState() => _CreateTaskFormState();
}

class _CreateTaskFormState extends State<CreateTaskForm> {
  @override
  Widget build(BuildContext context) {
    return Form(
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
