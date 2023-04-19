



import 'dart:convert';

import 'package:flutter/material.dart';

import 'home_page_manager_screen.dart';

class HomePage extends StatelessWidget {
  final stateManager = HomePageManager();

  HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const SizedBox(height: 50),
          Center(
            child: Wrap(
              spacing: 50,
              alignment: WrapAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: stateManager.makeGetRequest,
                  child: const Text('GET'),
                ),
                ElevatedButton(
                  onPressed: stateManager.makePostRequest,
                  child: const Text('POST'),
                ),
                ElevatedButton(
                  onPressed: stateManager.makePutRequest,
                  child: const Text('PUT'),
                ),
                ElevatedButton(
                  onPressed: stateManager.makePatchRequest,
                  child: const Text('PATCH'),
                ),
                ElevatedButton(
                  onPressed: stateManager.makeDeleteRequest,
                  child: const Text('DELETE'),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          ValueListenableBuilder<RequestState>(
            valueListenable: stateManager.resultNotifier,
            builder: (context, requestState, child) {
              if (requestState is RequestLoadInProgress) {
                return const CircularProgressIndicator();
              } else if (requestState is RequestLoadSuccess) {
                return Expanded(
                  child: SingleChildScrollView(
                    child: Text(
                      requestState.body,
                      style: const TextStyle(
                          fontSize: 14, color: Colors.deepPurple),
                    ),
                  ),
                );
              } else {
                return Container(
                  color: Colors.red,
                  height: 100,
                  width: 100,
                );
              }
            },
          ),
          ///////////////////////////////////////////////////////
          ValueListenableBuilder<RequestState>(
            valueListenable: stateManager.resultNotifier,
            builder: (context, requestState, child) {
              if (requestState is RequestLoadInProgress) {
                return const CircularProgressIndicator();
              } else if (requestState is RequestLoadSuccess) {
                final jsonData = jsonDecode(requestState.body) as List<dynamic>;
                return Expanded(
                  child: ListView.builder(
                    itemCount: jsonData.length,
                    itemBuilder: (context, index) {
                      final data = jsonData[index];
                      return ListTile(
                        title: Text(data['title']),
                        subtitle: Text(data['body']),
                      );
                    },
                  ),
                );
              } else {
                return Container(
                  color: Colors.red,
                  height: 100,
                  width: 100,
                );
              }
            },
          )
////////////////////////////////////////////////////////////////////
//           ValueListenableBuilder<RequestState>(
//             valueListenable: stateManager.resultNotifier,
//             builder: (context, requestState, child) {
//               if (requestState is RequestLoadInProgress) {
//                 return const CircularProgressIndicator();
//               } else if (requestState is RequestLoadSuccess) {
//                 final body = requestState.body;
//                 final bodyString = body is String ? body : json.encode(body);
//                 return Expanded(
//                   child: SingleChildScrollView(
//                     child: Text(
//                       bodyString,
//                       style: const TextStyle(
//                         fontSize: 14,
//                         color: Colors.deepPurple,
//                       ),
//                     ),
//                   ),
//                 );
//               } else {
//                 return Container(
//                   color: Colors.red,
//                   height: 100,
//                   width: 100,
//                 );
//               }
//             },
//           ),
        ],
      ),
    );
  }
}


