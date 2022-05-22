import 'package:techtest/src/data/models/address_result_model.dart';

abstract class AddressRepository {
  Future<AddressResultModel?> getList();
}
