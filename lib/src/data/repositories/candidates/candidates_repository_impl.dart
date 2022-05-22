import 'package:techtest/src/data/models/candidates_result_model.dart';
import 'package:techtest/src/domain/datasources/remote/candidates/candidates_service.dart';
import 'package:techtest/src/domain/repositories/candidates/candidates_repository.dart';

class CandidatesRepositoryImpl implements CandidatesRepository {
  final CandidatesService service;
  const CandidatesRepositoryImpl({required this.service});

  @override
  Future<CandidatesResultModel?> getList() async {
    try {
      var response = await service.getList();
      if (response.statusCode == 200) {
        return CandidatesResultModel.fromJson(response.data);
      } else {
        throw 'Request Failed -  ${response.statusCode}';
      }
    } catch (_) {
      rethrow;
    }
  }
}
