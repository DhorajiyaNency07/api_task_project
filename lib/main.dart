import 'package:api_task_project/screens/api_one/api_get_data_screen.dart';
import 'package:flutter/material.dart';

import 'screens/api_two/api_request_all.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      // home: const ApiGetDataScreen(),
      home: HomePage(),
    );
  }
}
// API TASK PROJECT 15/04/2023
