import 'package:flutter/foundation.dart';
import 'package:http/http.dart';

class HomePageManager {
  final resultNotifier = ValueNotifier<RequestState>(RequestInitial());
  static const urlPrefix = 'https://jsonplaceholder.typicode.com';

  Future<void> makeGetRequest() async {
    resultNotifier.value = RequestLoadInProgress();
    final url = Uri.parse('$urlPrefix/posts');
    Response response = await get(url);
    if (kDebugMode) {
      print('Status code: ${response.statusCode}');
    }
    if (kDebugMode) {
      print('Headers: ${response.headers}');
    }
    if (kDebugMode) {
      print('Body: ${response.body}');
    }
    _handleResponse(response);
  }

  Future<void> makePostRequest() async {
    resultNotifier.value = RequestLoadInProgress();
    final url = Uri.parse('$urlPrefix/posts');
    final headers = {"Content-type": "application/json"};
    const json = '{"title": "Hello", "body": "body text", "userId": 1}';
    final response = await post(url, headers: headers, body: json);
    print('Status code: ${response.statusCode}');
    print('Body: ${response.body}');
    _handleResponse(response);
  }

  Future<void> makePutRequest() async {
    resultNotifier.value = RequestLoadInProgress();
    final url = Uri.parse('$urlPrefix/posts/1');
    final headers = {"Content-type": "application/json"};
    const json = '{"title": "Hello", "body": "body text", "userId": 1}';
    final response = await put(url, headers: headers, body: json);
    print('Status code: ${response.statusCode}');
    print('Body: ${response.body}');
    _handleResponse(response);
  }

  Future<void> makePatchRequest() async {
    resultNotifier.value = RequestLoadInProgress();
    final url = Uri.parse('$urlPrefix/posts/1');
    final headers = {"Content-type": "application/json"};
    const json = '{"title": "Hello"}';
    final response = await patch(url, headers: headers, body: json);
    print('Status code: ${response.statusCode}');
    print('Body: ${response.body}');
    _handleResponse(response);
  }

  Future<void> makeDeleteRequest() async {
    resultNotifier.value = RequestLoadInProgress();
    final url = Uri.parse('$urlPrefix/posts/1');
    final response = await delete(url);
    print('Status code: ${response.statusCode}');
    print('Body: ${response.body}');
    _handleResponse(response);
  }

  void _handleResponse(Response response) {
    if (response.statusCode >= 400) {
      resultNotifier.value = RequestLoadFailure();
    } else {
      resultNotifier.value = RequestLoadSuccess(response.body);
    }
  }
}

class RequestState {
  const RequestState();
}

class RequestInitial extends RequestState {}

class RequestLoadInProgress extends RequestState {}

class RequestLoadSuccess extends RequestState {
  const RequestLoadSuccess(this.body);

  final String body;
}

class RequestLoadFailure extends RequestState {}

//
// import 'dart:convert';
// import 'package:flutter/foundation.dart';
// import 'package:http/http.dart';
//
// import 'model_two.dart';
//
// class HomePageManager {
//   final resultNotifier = ValueNotifier<RequestState>(RequestInitial());
//   static const urlPrefix = 'https://jsonplaceholder.typicode.com';
//
//   List<Post> posts = []; // create a list to store the posts
//
//   Future<void> makeGetRequest() async {
//     resultNotifier.value = RequestLoadInProgress();
//     final url = Uri.parse('$urlPrefix/posts');
//     Response response = await get(url);
//     if (kDebugMode) {
//       print('Status code: ${response.statusCode}');
//     }
//     if (kDebugMode) {
//       print('Headers: ${response.headers}');
//     }
//     if (kDebugMode) {
//       print('Body: ${response.body}');
//     }
//     _handleResponse(response);
//   }
//
//   // ...
//
//   void _handleResponse(Response response) {
//     if (response.statusCode >= 400) {
//       resultNotifier.value = RequestLoadFailure();
//     } else {
//       // parse the JSON response and store it in the list
//       posts = (json.decode(response.body) as List)
//           .map((data) => Post.fromJson(data))
//           .toList();
//       resultNotifier.value = RequestLoadSuccess(posts);
//     }
//   }
// }
//
// class RequestInitial {
// }
//
// class RequestLoadInProgress {
// }
//
// class RequestLoadFailure {
// }
//
// class RequestState {
// }
//
// class RequestLoadSuccess extends RequestState {
//   const RequestLoadSuccess(this.posts);
//
//   final List<Post> posts;
// }