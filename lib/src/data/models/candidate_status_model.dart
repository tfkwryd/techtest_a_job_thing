import 'dart:convert';

class CandidateStatusModel {
  CandidateStatusModel({
    required this.id,
    required this.status,
    required this.jobTitle,
    required this.companyName,
    required this.industry,
  });

  int id;
  String status;
  String jobTitle;
  String companyName;
  String industry;

  factory CandidateStatusModel.fromRawJson(String str) =>
      CandidateStatusModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory CandidateStatusModel.fromJson(Map<String, dynamic> json) =>
      CandidateStatusModel(
        id: json["id"],
        status: json["status"],
        jobTitle: json["job_title"],
        companyName: json["company_name"],
        industry: json["industry"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "status": status,
        "job_title": jobTitle,
        "company_name": companyName,
        "industry": industry,
      };
}
