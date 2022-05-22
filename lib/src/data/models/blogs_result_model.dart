import 'dart:convert';
import 'package:techtest/src/data/models/blog_model.dart';

class BlogsResultModel {
  BlogsResultModel({
    required this.results,
  });

  List<BlogModel> results;

  factory BlogsResultModel.fromRawJson(String str) =>
      BlogsResultModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory BlogsResultModel.fromJson(Map<String, dynamic> json) =>
      BlogsResultModel(
        results: List<BlogModel>.from(
            json["results"].map((x) => BlogModel.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "results": List<dynamic>.from(results.map((x) => x.toJson())),
      };
}
