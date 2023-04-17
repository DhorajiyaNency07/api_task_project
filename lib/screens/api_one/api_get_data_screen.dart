import 'dart:convert';
import 'package:api_task_project/model/api_model_screen.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ApiGetDataScreen extends StatefulWidget {
  const ApiGetDataScreen({Key? key}) : super(key: key);

  @override
  State<ApiGetDataScreen> createState() => _ApiGetDataScreenState();
}

class _ApiGetDataScreenState extends State<ApiGetDataScreen> {
  GetApi getApi = GetApi();

  @override
  void initState() {
    getApi.getApiClass();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("${getApi.efg.data?.id}"),
          Text("${getApi.efg.data?.title}"),
          Text("${getApi.efg.msg}"),
        ],
      ),
    );
  }
}

class GetApi {
  Efg<ApiModel> efg = Efg<ApiModel>();

  Future getApiClass() async {
    final abc = await http
        .get(Uri.parse("https://jsonplaceholder.typicode.com/albums/1"));
    if (abc.statusCode == 200) {
      efg.msg = "su";
      return efg.data = ApiModel.fromJson(jsonDecode(abc.body));
    } else {
      efg.msg = "fail";
      return efg.data = ApiModel.fromJson(jsonDecode(abc.body));
    }
  }
}

class Efg<T> {
  String? msg;
  T? data;
}
