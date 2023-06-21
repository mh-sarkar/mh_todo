import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:todo/src/modules/dashboard/models/todo_model.dart';
import 'package:todo/src/utils/global/global.dart';

class HomeController extends GetxController {
  static HomeController get to => Get.find();

  final RxList<TodoModel> _todoList = <TodoModel>[].obs;

  List<TodoModel> get todoList => _todoList;
  final todoListKey = 'TODO_LIST_KEY';

  @override
  onInit(){
    super.onInit();
    syncToRunTimeAllData();
  }

  syncToLocal() {
    Global.storage.write(
        todoListKey, _todoList.map((element) => element.toJson()).toList());
  }

  syncToRunTimeAllData() {
    dynamic todoLocalList = Global.storage.read(todoListKey) ?? [];
    todoLocalList.forEach((todo) {
      _todoList.add(TodoModel.fromJson(todo));
    });
  }

  setTodoInLocal(TodoModel todoItem) {
    final data = Global.storage.read(todoListKey);
    if (data == null) {
      Global.storage.write(todoListKey, []);
    }
    data.add(todoItem.toJson());
    Global.storage.write(todoListKey, data);
  }

  createTodo(String title, DateTime dateTime) {
    final date = DateFormat('yyyy-MM-dd').format(dateTime);
    final dateTi = DateFormat('yyyy-MM-dd hh:mm:ss').format(dateTime);
    final data = {
      "id": uuid.v4(),
      "title": title,
      "details": "",
      "type": "0",
      "todo_date": date,
      "complete_status": "0",
      "created_at": dateTi,
      "updated_at": dateTi
    };
    globalLogger.d(data);
    final todoItem = TodoModel.fromJson(data);
    setTodoInLocal(todoItem);
    _todoList.add(todoItem);
  }

  updateTodo(TodoModel todoItem) {
    _todoList[_todoList.indexWhere((element) => element.id == todoItem.id)] = todoItem;
    syncToLocal();
  }

  removeTodo(TodoModel todoItem) {
    _todoList.removeAt(_todoList.indexWhere((element) => element.id == todoItem.id));
    syncToLocal();}
}