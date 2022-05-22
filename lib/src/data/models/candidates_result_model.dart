import 'dart:convert';

import 'package:techtest/src/data/models/candidate_model.dart';

class CandidatesResultModel {
  CandidatesResultModel({
    required this.results,
  });

  List<CandidateModel> results;

  factory CandidatesResultModel.fromRawJson(String str) =>
      CandidatesResultModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory CandidatesResultModel.fromJson(Map<String, dynamic> json) =>
      CandidatesResultModel(
        results: List<CandidateModel>.from(
            json["results"].map((x) => CandidateModel.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "results": List<dynamic>.from(results.map((x) => x.toJson())),
      };
}
