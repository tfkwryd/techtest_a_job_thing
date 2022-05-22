import 'package:techtest/src/data/models/candidates_result_model.dart';

abstract class CandidatesRepository {
  Future<CandidatesResultModel?> getList();
}
