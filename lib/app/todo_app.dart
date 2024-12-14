import 'package:flutter/material.dart';
import 'package:todo_app_flutter/config/config.dart';
import 'package:todo_app_flutter/screens/screens.dart';

class ToDoApp extends StatelessWidget {
  const ToDoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.light,
      home: const HomeScreen(),
    );
  }
}
