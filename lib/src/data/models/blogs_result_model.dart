import 'dart:convert';

class BlogsResultModel {
  BlogsResultModel({
    required this.results,
  });

  List<BlogsResultModel> results;

  factory BlogsResultModel.fromRawJson(String str) =>
      BlogsResultModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory BlogsResultModel.fromJson(Map<String, dynamic> json) =>
      BlogsResultModel(
        results: List<BlogsResultModel>.from(
            json["results"].map((x) => BlogsResultModel.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "results": List<dynamic>.from(results.map((x) => x.toJson())),
      };
}
