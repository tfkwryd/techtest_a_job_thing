import 'package:techtest/src/data/models/emails_result_model.dart';
import 'package:techtest/src/domain/datasources/remote/emails/emails_service.dart';
import 'package:techtest/src/domain/repositories/emails/emails_repository.dart';

class EmailsRepositoryImpl implements EmailsRepository {
  final EmailsService service;
  const EmailsRepositoryImpl({required this.service});

  @override
  Future<EmailsResultModel?> getList() async {
    try {
      var response = await service.getList();
      if (response.statusCode == 200) {
        return EmailsResultModel.fromJson(response.data);
      } else {
        throw 'Request Failed -  ${response.statusCode}';
      }
    } catch (_) {
      rethrow;
    }
  }
}
