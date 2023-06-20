import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:todo/src/modules/dashboard/models/todo_model.dart';
import 'package:todo/src/utils/global/global.dart';

class HomeController extends GetxController {
  static HomeController get to => Get.find();

  final RxList<TodoModel> _todoList = <TodoModel>[].obs;

  List<TodoModel> get todoList => _todoList;
  final todoListKey = 'TODO_LIST_KEY';

  syncToLocal(){

  }

  syncToRunTime(){

  }

  setTodoInLocal(TodoModel todoItem){
    final data = Global.storage.read(todoListKey);
    if(data!=null && data.isNotEmpty){

    }else{
      Global.storage.write(todoListKey, []);
    }
  }


  createTodo(String title, DateTime dateTime){
    final date = DateFormat('yyyy-MM-dd').format(dateTime);
    final dateTi = DateFormat('yyyy-MM-dd hh:mm:ss').format(dateTime);
    final data = {
      "id": uuid.v4(),
      "title": title,
      "details": "",
      "type": "0",
      "todo_date": date,
      "complete_status": "0",
      "created_at":dateTi,
      "updated_at":dateTi
    };
    final todoItem = TodoModel.fromJson(data);



  }

  updateTodo(){

  }

  removeTodo(){

  }
}