import 'dart:convert';
import 'package:techtest/src/data/models/email_model.dart';

class EmailsResultModel {
  EmailsResultModel({
    required this.results,
  });

  List<EmailModel> results;

  factory EmailsResultModel.fromRawJson(String str) =>
      EmailsResultModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory EmailsResultModel.fromJson(Map<String, dynamic> json) =>
      EmailsResultModel(
        results: List<EmailModel>.from(
            json["results"].map((x) => EmailModel.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "results": List<dynamic>.from(results.map((x) => x.toJson())),
      };
}
