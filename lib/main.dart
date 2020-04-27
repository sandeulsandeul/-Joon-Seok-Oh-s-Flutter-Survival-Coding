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
  // 할 일 문자열 조작을 위한 컨트롤러
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
                    onPressed: () => _addTodo(Todo(_todoController.text)),
                  ),
                ],
              ),
              Expanded(
                  child: ListView(
                    children: _items.map((todo) => _buildItemWidget(todo)).toList(), 
                    //전체 UI와 할 일 목록 UI 결합
                )
              )
            ],
          ),
        ),
    );
  }
  Widget _buildItemWidget(Todo todo){
    //Todo 객체를 인수로 받고 ListTile위젯을 반환
    return ListTile(
      onTap: ()=> _toggleTodo(todo), //Todo: 클릭시 완료/취소되도록 수정
      title: Text(
        todo.title,
        style: todo.isDone
          ?TextStyle(
            decoration: TextDecoration.lineThrough,
            fontStyle: FontStyle.italic,
        ):null,
      ),
      trailing: IconButton(
        icon: Icon(Icons.delete_forever),
        onPressed: () => _deleteTodo(todo),
      ),
    );
  }
  // 할 일 추가 메서드
  Widget _addTodo(Todo todo) {
    setState(() {
      _items.add(todo);
      _todoController.text = ''; 
    });
  }
  // 할일 삭제 메서드
  Widget _deleteTodo(Todo todo){
    setState(() {
      _items.remove(todo);
    });
  }
  //할 일 완료/미완료 메서드
  Widget _toggleTodo(Todo todo){
    setState(() {
      todo.isDone = !todo.isDone;
    });
  }
}

