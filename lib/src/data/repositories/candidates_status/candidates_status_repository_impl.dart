import 'package:techtest/src/data/models/candidates_status_result_model.dart';
import 'package:techtest/src/domain/datasources/remote/candidates_status/candidates_status_service.dart';
import 'package:techtest/src/domain/repositories/candidates_status/candidates_status_repository.dart';

class CandidatesStatusRepositoryImpl implements CandidatesStatusRepository {
  final CandidatesStatusService service;
  const CandidatesStatusRepositoryImpl({required this.service});
  @override
  Future<CandidatesStatusResultModel?> getList() async {
    try {
      var response = await service.getList();
      if (response.statusCode == 200) {
        return CandidatesStatusResultModel.fromJson(response.data);
      } else {
        throw 'Request Failed -  ${response.statusCode}';
      }
    } catch (_) {
      rethrow;
    }
  }
}
