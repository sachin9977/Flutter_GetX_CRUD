import 'package:assignment/screens/auth.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:get/get.dart';
import './screens/home_screen.dart';
import './screens/todo_screen.dart';

void main() async {
  await GetStorage.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Todo with GetX',
      initialRoute: AuthScreen.id,
      theme: ThemeData(
        
        primarySwatch: Colors.blueGrey,
      ),
      getPages: [
        GetPage(name: AuthScreen.id, page: () => AuthScreen()),
        GetPage(name: TodoScreen.id, page: () => TodoScreen()),
        GetPage(name: HomeScreen.id, page: () => HomeScreen())
      ],
    );
  }
}
