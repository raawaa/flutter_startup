import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CreateTask extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(title: new Text('create task')),
      body: new Form(
          child: new ListView(
        children: <Widget>[
          new TextFormField(
            keyboardType: TextInputType.text,
            decoration: new InputDecoration(hintText: "title"),
          )
        ],
      )),
    );
  }
}
