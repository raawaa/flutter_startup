import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'models/task.dart';

class Detail extends StatelessWidget {
  final Task task;

  Detail(this.task);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detail'),
      ),
      body: Center(
          child: Column(
        children: <Widget>[Text(task.title), Text(task.content)],
      )),
    );
  }
}
