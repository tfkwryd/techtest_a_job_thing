import 'dart:convert';

class CandidateModel {
  CandidateModel({
    required this.id,
    required this.name,
    required this.gender,
    required this.photo,
    required this.birthday,
    required this.expired,
  });

  int id;
  String name;
  String gender;
  String photo;
  int birthday;
  int expired;

  factory CandidateModel.fromRawJson(String str) =>
      CandidateModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory CandidateModel.fromJson(Map<String, dynamic> json) => CandidateModel(
        id: json["id"],
        name: json["name"],
        gender: json["gender"],
        photo: json["photo"],
        birthday: json["birthday"],
        expired: json["expired"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "gender": gender,
        "photo": photo,
        "birthday": birthday,
        "expired": expired,
      };
}
