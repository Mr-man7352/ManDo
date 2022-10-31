import 'package:shared_preferences/shared_preferences.dart';
import '../model/todo.dart';
import 'dart:convert';

class TodoSharedPreference {
  static late SharedPreferences _preferences;

  static const _keyTodos = 'todos';

  static Future init() async =>
      _preferences = await SharedPreferences.getInstance();

  static Future setTodos(List<ToDo> todos) async {
    List<dynamic> todoList = [];
    for (ToDo todo in todos.reversed) {
      Map<String, dynamic> local = {
        "id": todo.id,
        "todoText": todo.todoText,
        "isDone": todo.isDone
      };
      todoList.add(local);
    }
    print(todoList);
    String encodedMap = json.encode(todoList);
    await _preferences.setString(_keyTodos, encodedMap);
  }

  static List<dynamic> getTodos() {
    String? encodedMap = _preferences.getString(_keyTodos) ?? '[]';
    List<dynamic> decodedMap = json.decode(encodedMap);
    print(decodedMap);
    if (decodedMap.length > 0) {
      return decodedMap;
    } else {
      return [];
    }
  }
}
