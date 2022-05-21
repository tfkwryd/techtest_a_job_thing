import 'dart:convert';

class EmailModel {
  EmailModel({
    required this.id,
    required this.email,
    required this.phone,
  });

  int id;
  String email;
  String phone;

  factory EmailModel.fromRawJson(String str) =>
      EmailModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory EmailModel.fromJson(Map<String, dynamic> json) => EmailModel(
        id: json["id"],
        email: json["email"],
        phone: json["phone"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "email": email,
        "phone": phone,
      };
}
