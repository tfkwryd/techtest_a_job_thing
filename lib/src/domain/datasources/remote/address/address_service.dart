import 'package:dio/dio.dart';

abstract class AddressService {
  Future<Response<dynamic>> getList();
}
