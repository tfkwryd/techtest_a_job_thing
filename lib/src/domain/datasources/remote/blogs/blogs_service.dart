import 'package:dio/dio.dart';

abstract class BlogsService {
  Future<Response<dynamic>> getList();
}
