import 'dart:convert';

import 'package:double_dating_front/models/post.dart';

import 'couple.dart';

Comment commentFromJson(String str) => Comment.fromJson(json.decode(str));

List<Comment> commentListFromJson(String str) => List<Comment>.from(json.decode(str).map((x) => Comment.fromJson(x)));


class Comment {
  int? id;
  String? content;
  String? creationDate;
  Couple? owner;
  Post? post;
  List<Comment>? response;


  Comment({
    this.id,
     this.content,
     this.creationDate,
    this.owner,
    this.post,
  });

  factory Comment.fromJson(Map<String, dynamic> json) => Comment(
    id: json["id"],
    content: json["content"],
    creationDate: json["creationDate"],
    owner: coupleFromJson(json["owner"]),
    post: postFromJson(json["post"]),
  );

}
