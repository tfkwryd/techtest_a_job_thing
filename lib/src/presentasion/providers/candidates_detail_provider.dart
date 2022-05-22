import 'package:flutter/material.dart';
import 'package:techtest/src/core/utils/toast_utils.dart';
import 'package:techtest/src/data/datasources/remote/address/address_service_impl.dart';
import 'package:techtest/src/data/datasources/remote/candidates_status/candidates_status_service_impl.dart';
import 'package:techtest/src/data/datasources/remote/emails/emails_service_impl.dart';
import 'package:techtest/src/data/models/address_model.dart';
import 'package:techtest/src/data/models/candidate_status_model.dart';
import 'package:techtest/src/data/models/email_model.dart';
import 'package:techtest/src/data/repositories/address/address_repository_impl.dart';
import 'package:techtest/src/data/repositories/candidates_status/candidates_status_repository_impl.dart';
import 'package:techtest/src/data/repositories/emails/emails_repository.dart';
import 'package:techtest/src/domain/repositories/address/address_repository.dart';
import 'package:techtest/src/domain/repositories/candidates_status/candidates_status_repository.dart';
import 'package:techtest/src/domain/repositories/emails/emails_repository.dart';

class CandidatesDetailProvider extends ChangeNotifier {
  final AddressRepository _addressRepository = AddressRepositoryImpl(
    service: AddressServiceImpl(),
  );
  final CandidatesStatusRepository _candidatesStatusRepository =
      CandidatesStatusRepositoryImpl(
    service: CandidatesStatusServiceImpl(),
  );
  final EmailsRepository _emailsRepository = EmailsRepositoryImpl(
    service: EmailsServiceImpl(),
  );
  bool isLoading = false;

  AddressModel? address;
  CandidateStatusModel? candidateStatus;
  EmailModel? email;

  Future<void> getDetail({required int id}) async {
    isLoading = true;
    notifyListeners();
    String _messageError = '';
    try {
      await _addressRepository.getList().then((value) {
        if (value != null) {
          address = value.results.where((element) => element.id == id).first;
        }
      });
    } catch (e) {
      _messageError += '$e';
    }
    try {
      await _candidatesStatusRepository.getList().then((value) {
        if (value != null) {
          candidateStatus =
              value.results.where((element) => element.id == id).first;
        }
      });
    } catch (e) {
      _messageError += '\n$e';
    }
    try {
      await _emailsRepository.getList().then((value) {
        if (value != null) {
          email = value.results.where((element) => element.id == id).first;
        }
      });
    } catch (e) {
      _messageError += '\n$e';
    }
    if (_messageError != '') {
      Toast.show(message: _messageError.toString(), toastType: ToastType.error);
    }
    isLoading = false;
    notifyListeners();
  }
}
