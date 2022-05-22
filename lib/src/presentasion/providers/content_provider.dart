import 'package:flutter/material.dart';
import 'package:techtest/src/core/utils/toast_utils.dart';
import 'package:techtest/src/data/datasources/remote/blogs/blogs_service_impl.dart';
import 'package:techtest/src/data/datasources/remote/candidates/candidates_service_impl.dart';
import 'package:techtest/src/data/models/blog_model.dart';
import 'package:techtest/src/data/models/candidate_model.dart';
import 'package:techtest/src/data/repositories/blogs/blogs_repository_impl.dart';
import 'package:techtest/src/data/repositories/candidates/candidates_repository_impl.dart';
import 'package:techtest/src/domain/repositories/blogs/blogs_repository.dart';
import 'package:techtest/src/domain/repositories/candidates/candidates_repository.dart';

class ContentProvider extends ChangeNotifier {
  final CandidatesRepository _candidatesRepository = CandidatesRepositoryImpl(
    service: CandidatesServiceImpl(),
  );
  final BlogsRepository _blogsRepository = BlogsRepositoryImpl(
    service: BlogsServiceImpl(),
  );

  bool isLoading = false;
  List<dynamic> dataSource = [];
  List<dynamic> data = [];

  Future<void> getList() async {
    isLoading = true;
    notifyListeners();
    String _messageError = '';
    try {
      await _blogsRepository.getList().then((value) {
        if (value != null) {
          dataSource.addAll(value.results);
        }
      });
    } catch (e) {
      _messageError += '$e';
    }
    try {
      await _candidatesRepository.getList().then((value) {
        if (value != null) {
          dataSource.addAll(value.results);
        }
      });
    } catch (e) {
      _messageError += '\n$e';
    }
    if (_messageError != '') {
      Toast.show(message: _messageError.toString(), toastType: ToastType.error);
    }
    dataSource.shuffle();
    data = dataSource;
    isLoading = false;
    notifyListeners();
  }

  Future<void> search({String? keyword}) async {
    try {
      if (keyword != null && keyword != '') {
        data = dataSource.where((element) {
          if (element is BlogModel) {
            return element.title
                    .toLowerCase()
                    .contains(keyword.toLowerCase()) ||
                element.author.toLowerCase().contains(keyword.toLowerCase());
          } else if (element is CandidateModel) {
            return element.name.toLowerCase().contains(keyword.toLowerCase());
          } else {
            return false;
          }
        }).toList();
      } else {
        data = dataSource;
      }
    } catch (e) {
      Toast.show(message: e.toString(), toastType: ToastType.error);
    }
    notifyListeners();
  }
}
