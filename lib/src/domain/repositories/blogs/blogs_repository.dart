import 'package:techtest/src/data/models/blogs_result_model.dart';

abstract class BlogsRepository {
  Future<BlogsResultModel?> getList();
}
