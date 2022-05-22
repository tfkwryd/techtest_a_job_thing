import 'package:techtest/src/data/models/emails_result_model.dart';

abstract class EmailsRepository {
  Future<EmailsResultModel?> getList();
}
