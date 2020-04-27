import 'package:flutter/material.dart';

void main() => runApp(MyApp());
//할 일 클래스
class Todo{
  bool isDone = false; //완료 여부
  String title; // 할 일 내용

  Todo(this.title);
}
// 시작 클래스
class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '할 일 관리 ',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: TodoListPage(),
    );
  }
}

class TodoListPage extends StatefulWidget {
  @override
  _TodoListPageState  createState() => _TodoListPageState();
}

class _TodoListPageState extends State<TodoListPage>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('남은 할 일'),
        ),
        body: Container()
    );
  }
}

