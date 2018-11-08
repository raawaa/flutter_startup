import 'package:uuid/uuid.dart';

class Task {
  int id;
  String title;
  String content;


  Task({this.title, this.content}) {
    // id = new Uuid().v4();
  }

  Map<String, dynamic> toMap() {
    return {'id': id, 'title': title, 'content': content};
  }

  Task.fromMap(Map<String, dynamic> map) {
    id = map['id'];
    title = map['title'];
    content = map['content'];
  }
}
