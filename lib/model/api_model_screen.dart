// class ApiModel {
//   final int? userId;
//   final int? id;
//   final String? title;
//
//   ApiModel({
//     this.userId,
//     this.id,
//     this.title,
//   });
//
//   ApiModel.fromJson(Map<String, dynamic> json)
//       : userId = json['userId'] as int?,
//         id = json['id'] as int?,
//         title = json['title'] as String?;
//
//   Map<String, dynamic> toJson() => {
//     'userId' : userId,
//     'id' : id,
//     'title' : title
//   };
// }