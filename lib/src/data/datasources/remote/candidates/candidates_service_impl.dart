import 'package:dio/dio.dart';
import 'package:techtest/src/core/constants/service_constants.dart';
import 'package:techtest/src/domain/datasources/remote/candidates/candidates_service.dart';

class CandidatesServiceImpl implements CandidatesService {
  @override
  Future<Response> getList() async {
    try {
      final _headers = <String, dynamic>{
        "Accept": "application/json",
        "Content-Type": "application/x-www-form-urlencoded"
      };
      return await Dio().get(
        ServiceConstants.candidatesEndPoint,
        options: Options(
          followRedirects: false,
          validateStatus: (status) {
            return status! < 500;
          },
          headers: _headers,
        ),
      );
    } catch (_) {
      throw 'A server error occurred, please try again later';
    }
  }
}
