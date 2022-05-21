import 'package:techtest/src/data/models/blogs_result_model.dart';
import 'package:techtest/src/domain/datasources/remote/blogs/blogs_service.dart';
import 'package:techtest/src/domain/repositories/blogs/blogs_repository.dart';

class BlogsRepositoryImpl implements BlogsRepository {
  final BlogsService service;
  const BlogsRepositoryImpl({required this.service});

  @override
  Future<BlogsResultModel?> getList() async {
    try {
      var response = await service.getList();
      if (response.statusCode == 200) {
        return BlogsResultModel.fromJson(response.data);
      } else {
        throw 'Request Failed -  ${response.statusCode}';
      }
    } catch (_) {
      rethrow;
    }
  }
}
