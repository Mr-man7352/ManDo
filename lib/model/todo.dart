import '../utils/todo_SharedPreference.dart';

class ToDo {
  String? id;
  String? todoText;
  bool isDone;

  ToDo({
    required this.id,
    required this.todoText,
    this.isDone = false,
  });

  static List<ToDo> todoList() {
    List<dynamic> localStoredTodo = TodoSharedPreference.getTodos();
    if (localStoredTodo.isNotEmpty) {
      List<ToDo> todoList = [];
      for (var toDo in localStoredTodo) {
        todoList.add(ToDo(
            id: toDo["id"],
            todoText: toDo['todoText'],
            isDone: toDo['isDone']));
      }
      return todoList;
    } else {
      return [];
    }
  }
}
