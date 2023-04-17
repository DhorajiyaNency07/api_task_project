import 'package:api_task_project/functions/api_tasks_screen.dart';
import 'package:api_task_project/model/api_model_screen.dart';
import 'package:flutter/material.dart';

class ApiHomeScreen extends StatefulWidget {
  const ApiHomeScreen({Key? key}) : super(key: key);

  @override
  State<ApiHomeScreen> createState() => _ApiHomeScreenState();
}

class _ApiHomeScreenState extends State<ApiHomeScreen> {
  late Future<ApiModel> getData;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            MaterialButton(
              color: Colors.green,
              onPressed: () {},
              child: const Text("Get API"),
            ),
            const SizedBox(
              height: 20,
            ),
            MaterialButton(
              color: Colors.yellowAccent,
              onPressed: () {},
              child: const Text("Post API"),
            ),
            const SizedBox(
              height: 20,
            ),
            MaterialButton(
              color: Colors.orange,
              onPressed: () {},
              child: const Text("Put API"),
            ),
            const SizedBox(
              height: 20,
            ),
            MaterialButton(
              color: Colors.red,
              onPressed: () {},
              child: const Text("Delete API"),
            ),
            const SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}
