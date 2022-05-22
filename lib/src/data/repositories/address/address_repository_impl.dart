import 'package:techtest/src/data/models/address_result_model.dart';
import 'package:techtest/src/domain/datasources/remote/address/address_service.dart';
import 'package:techtest/src/domain/repositories/address/address_repository.dart';

class AddressRepositoryImpl implements AddressRepository {
  final AddressService service;
  const AddressRepositoryImpl({required this.service});

  @override
  Future<AddressResultModel?> getList() async {
    try {
      var response = await service.getList();
      if (response.statusCode == 200) {
        return AddressResultModel.fromJson(response.data);
      } else {
        throw 'Request Failed - ${response.statusCode}';
      }
    } catch (_) {
      rethrow;
    }
  }
}
