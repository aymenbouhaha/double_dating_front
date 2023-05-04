import 'dart:convert';

import 'media.dart';

List<Post> postListFromJson(String str) => List<Post>.from(json.decode(str).map((x) => Post.fromJson(x)));

Post postFromJson(String str) => Post.fromJson(json.decode(str));


class Post {
  int? id;
  String? caption;
  String? creationDate;
  List<Media>? medias;


  Post({
     this.id,
     this.caption,
     this.creationDate,
    this.medias
  });

  factory Post.fromJson(Map<String, dynamic> json) => Post(
    id: json["id"],
    caption: json["caption"],
    creationDate: json["creationDate"],
      medias: mediaListFromJson(json["medias"])
  );


}
