import 'dart:convert';
import 'package:techtest/src/data/models/address_model.dart';

class AddressResultModel {
  AddressResultModel({
    required this.results,
  });

  List<AddressModel> results;

  factory AddressResultModel.fromRawJson(String str) =>
      AddressResultModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory AddressResultModel.fromJson(Map<String, dynamic> json) =>
      AddressResultModel(
        results: List<AddressModel>.from(
            json["results"].map((x) => AddressModel.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "results": List<dynamic>.from(results.map((x) => x.toJson())),
      };
}
