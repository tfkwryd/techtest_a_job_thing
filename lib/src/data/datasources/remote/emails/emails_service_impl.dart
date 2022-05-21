import 'package:dio/dio.dart';
import 'package:techtest/src/core/constants/service_constants.dart';
import 'package:techtest/src/domain/datasources/remote/emails/emails_service.dart';

class EmailsServiceImpl implements EmailsService {
  @override
  Future<Response> getList() async {
    try {
      final _headers = <String, dynamic>{
        "Accept": "application/json",
        "Content-Type": "application/x-www-form-urlencoded"
      };
      return await Dio().get(
        ServiceConstants.emailsEndPoint,
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
