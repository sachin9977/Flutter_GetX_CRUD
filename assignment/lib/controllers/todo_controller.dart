import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import '../models/todo.dart';

class TodoController extends GetxController {
   var todos = List<Todo>.empty().obs;

  @override
  void onInit() {
    List? storeTodos = GetStorage().read<List>('todo');

    if (storeTodos != null) {
      todos = storeTodos.map((e) => Todo.fromJson(e)).toList().obs;
    }
    ever(todos, (_) {
      GetStorage().write('todo', todos.toList());
    });
    super.onInit();
  }
}
