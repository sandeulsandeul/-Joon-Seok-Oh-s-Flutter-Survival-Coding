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
// TodoListPage 클래스
class TodoListPage extends StatefulWidget {
  @override
  _TodoListPageState  createState() => _TodoListPageState();
}
// TodoListPage State클래스
class _TodoListPageState extends State<TodoListPage>{
  // 할 일 목록을 저장할 리스트
  final _items = <Todo>[];
  // 할 일 문자열 조작을 위한 커트롤러
  var _todoController = TextEditingController();
  @override
  void dispose(){
    _todoController.dispose(); // 사용이 끝나면 해제
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('남은 할 일'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: <Widget>[
              Row(
                children: <Widget>[
                  Expanded(
                    child: TextField(
                      controller: _todoController,
                    ),
                  ),
                  RaisedButton(
                    child: Text('추가'),
                    onPressed: (){},
                  ),
                ],
              ),
              Expanded(
                  child: ListView(
                  children: <Widget>[],
                )
              )
            ],
          ),
        ),
    );
  }
}

