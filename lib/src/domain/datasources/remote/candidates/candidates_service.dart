import 'package:dio/dio.dart';

abstract class CandidatesService {
  Future<Response<dynamic>> getList();
}
