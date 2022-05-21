import 'dart:convert';

import 'package:techtest/src/data/models/candidate_status_model.dart';

class CandidatesStatusResultModel {
  CandidatesStatusResultModel({
    required this.results,
  });

  List<CandidateStatusModel> results;

  factory CandidatesStatusResultModel.fromRawJson(String str) =>
      CandidatesStatusResultModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory CandidatesStatusResultModel.fromJson(Map<String, dynamic> json) =>
      CandidatesStatusResultModel(
        results: List<CandidateStatusModel>.from(
            json["results"].map((x) => CandidateStatusModel.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "results": List<dynamic>.from(results.map((x) => x.toJson())),
      };
}
