import 'package:flutter/material.dart';

import 'db_providers.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(title: 'Flutter Demo', home: RandomWords());
  }
}

class RandomWordsState extends State<RandomWords> {
  final _biggerFont = const TextStyle(fontSize: 18.0);
  TodoProvider todoProvider = new TodoProvider();
  Future _todoList;


  @override
  void initState() {
    super.initState();
    _todoList = todoProvider.open(tableTodo).then((_) {
      return todoProvider.getAllTodos();
    });
  }

  FutureBuilder _buildSuggestions() {
    return new FutureBuilder(
        future: _todoList,
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return ListView.builder(
                itemCount: snapshot.data.length,
                itemBuilder: (context, i) {
//                  if (i.isOdd) {
//                    return Divider();
//                  }
//                  final index = i ~/ 2;
//        if (index >= _suggestions.length) {
//          _suggestions.addAll(generateWordPairs().take(10));
//        }
                  return _buildRow(snapshot.data[i]);
                });
          }else{
            return new Container(width: 0.0, height: 0.0);
          }
        });

//    return ListView.builder(
//      padding: const EdgeInsets.all(16.0),
//      itemBuilder: (context, i) {
//        if (i.isOdd) {
//          return Divider();
//        }
//        final index = i ~/ 2;
////        if (index >= _suggestions.length) {
////          _suggestions.addAll(generateWordPairs().take(10));
////        }
//        return _buildRow(_todoList[index]);
//      },
//    );
  }

  Widget _buildRow(Todo todo) {
    return ListTile(title: Text(todo.title, style: _biggerFont));
  }

  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(onPressed: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => TodoForm()));
      }),
      body: _buildSuggestions(),
      appBar: AppBar(title: Text('Startup Name Generator')),
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            DrawerHeader(
              child: Container(),
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text('love'),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => TodoForm()));
              },
            ),
            ListTile(
              leading: Icon(Icons.location_on),
              title: Text('情境'),
            )
          ],
        ),
      ),
    );
  }
}

class RandomWords extends StatefulWidget {
  @override
  RandomWordsState createState() => new RandomWordsState();
}

class TodoForm extends StatefulWidget {
  @override
  _TodoFormState createState() => _TodoFormState();
}

class _TodoFormState extends State<TodoForm> {
  final formController = TextEditingController();
  TodoProvider todoProvider = new TodoProvider();

  @override
  void dispose() {
    formController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('create Todo')),
        body: Center(
          child: Column(children: <Widget>[
            TextField(
              decoration: InputDecoration(hintText: 'Todo'),
              controller: formController,
            ),
            FlatButton(
                child: Text('submit'),
                onPressed: () async {
                  Todo todoItem = Todo(formController.text, false);
                  await todoProvider.open('todo');
                  await todoProvider.insert(todoItem);
                  var savedTodo = await todoProvider.getTodo(3);
                  print(savedTodo.title);
                }),
          ]),
        ));
  }
}
