import 'package:uuid/uuid.dart';

class Task {
  String _id;
  String _title;
  String _content;

  String get title => _title;

  Task(this._title, this._content) {
    _id = new Uuid().v4();
  }

  Map<String, dynamic> toMap() {
    return {'id': _id, 'title': _title, 'content': _content};
  }

  Task.fromMap(Map<String, dynamic> map) {
    _id = map['id'];
    _title = map['title'];
    _content = map['content'];
  }
}
