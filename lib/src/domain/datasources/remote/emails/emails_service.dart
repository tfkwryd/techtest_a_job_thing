import 'package:dio/dio.dart';

abstract class EmailsService {
  Future<Response<dynamic>> getList();
}
