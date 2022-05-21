import 'package:dio/dio.dart';

abstract class CandidatesStatusService {
  Future<Response<dynamic>> getList();
}
