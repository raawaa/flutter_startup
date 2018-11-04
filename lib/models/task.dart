import 'package:uuid/uuid.dart';

class Task {
  String _id;
  String title;
  String content;


  Task({this.title, this.content}) {
    _id = new Uuid().v4();
  }

  Map<String, dynamic> toMap() {
    return {'id': _id, 'title': title, 'content': content};
  }

  Task.fromMap(Map<String, dynamic> map) {
    _id = map['id'];
    title = map['title'];
    content = map['content'];
  }
}
