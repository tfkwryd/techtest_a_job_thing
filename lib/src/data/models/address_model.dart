import 'dart:convert';

class AddressModel {
  AddressModel({
    required this.id,
    required this.address,
    required this.city,
    required this.state,
    required this.zipCode,
  });

  int id;
  String address;
  String city;
  String state;
  int zipCode;

  factory AddressModel.fromRawJson(String str) =>
      AddressModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory AddressModel.fromJson(Map<String, dynamic> json) => AddressModel(
        id: json["id"],
        address: json["address"],
        city: json["city"],
        state: json["state"],
        zipCode: json["zip_code"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "address": address,
        "city": city,
        "state": state,
        "zip_code": zipCode,
      };
}
