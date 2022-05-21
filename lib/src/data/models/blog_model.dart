import 'dart:convert';

class BlogModel {
  BlogModel({
    required this.id,
    required this.title,
    required this.subTitle,
    required this.photo,
    required this.content,
    required this.author,
    required this.createAt,
    required this.tag,
  });

  int id;
  String title;
  String subTitle;
  String photo;
  String content;
  String author;
  int createAt;
  String tag;

  factory BlogModel.fromRawJson(String str) =>
      BlogModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory BlogModel.fromJson(Map<String, dynamic> json) => BlogModel(
        id: json["id"],
        title: json["title"],
        subTitle: json["subTitle"],
        photo: json["photo"],
        content: json["content"],
        author: json["author"],
        createAt: json["create_at"],
        tag: json["tag"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "subTitle": subTitle,
        "photo": photo,
        "content": content,
        "author": author,
        "create_at": createAt,
        "tag": tag,
      };
}
