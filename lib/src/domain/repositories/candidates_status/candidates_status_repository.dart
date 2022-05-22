import 'package:techtest/src/data/models/candidates_status_result_model.dart';

abstract class CandidatesStatusRepository {
  Future<CandidatesStatusResultModel?> getList();
}
