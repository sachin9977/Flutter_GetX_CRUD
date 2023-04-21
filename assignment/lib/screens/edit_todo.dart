import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/todo_controller.dart';

class EditTodo extends StatelessWidget {
  final TodoController todoController = Get.find<TodoController>();
  EditTodo({Key? key, this.index}) : super(key: key);
  final int? index;
  @override
  Widget build(BuildContext context) {
    final TextEditingController textEditingController =
        TextEditingController(text: todoController.todos[index!].text);
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(40),
        child: Column(
          children: [
            Expanded(
              child: TextField(
                decoration: const InputDecoration(
                  hintText: "Write task here",
                  border: InputBorder.none,
                ),
                style: const TextStyle(
                  fontSize: 25.0,
                ),
                keyboardType: TextInputType.multiline,
                maxLines: 10,
                autofocus: true,
                controller: textEditingController,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                TextButton(
                  child: const Text('Cancel'),
                  onPressed: () {
                    Get.back();
                  },
                ),
                TextButton(
                  child: const Text('Update'),
                  onPressed: () {
                    var editing = todoController.todos[index!];
                    editing.text = textEditingController.text;
                    todoController.todos[index!] = editing;
                    Get.back();
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
