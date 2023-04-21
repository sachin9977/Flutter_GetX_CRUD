import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/todo_controller.dart';
import '../screens/todo_screen.dart';
import 'edit_todo.dart';

class HomeScreen extends StatelessWidget {
  static const id = '/Home_screen';
  final TodoController todoController = Get.put(TodoController());
  HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Todo with GetX"),
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          Get.toNamed(TodoScreen.id);
        },
      ),
      body: Obx(() => ListView.builder(
            itemCount: todoController.todos.length,
            itemBuilder: (ctx, index) => Dismissible(
              background: Container(
                color: Colors.deepOrange,
                child: const Icon(
                  Icons.delete,
                  color: Colors.white,
                ),
              ),
              onDismissed: (_) {
                todoController.todos.removeAt(index);
                Get.snackbar('Remove', "The task was deleted.",
                    snackPosition: SnackPosition.BOTTOM,
                    margin: const EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 20,
                    ));
              },
              key: UniqueKey(),
              child: ListTile(
                title: Text(
                  todoController.todos[index].text!,
                  style: todoController.todos[index].done
                      ? const TextStyle(
                          color: Colors.red,
                          decoration: TextDecoration.lineThrough)
                      : const TextStyle(
                          color: Colors.black,
                        ),
                ),
                trailing: IconButton(
                  onPressed: () => Get.to(
                    () => EditTodo(index: index),
                  ),
                  icon: const Icon(Icons.edit),
                ),
                leading: Checkbox(
                    value: todoController.todos[index].done,
                    onChanged: (newVal) {
                      var todo = todoController.todos[index];
                      todo.done = newVal!;
                      todoController.todos[index] = todo;
                    }),
              ),
            ),
          )),
    );
  }
}
