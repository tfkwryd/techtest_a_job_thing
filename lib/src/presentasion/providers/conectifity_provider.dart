import 'package:flutter/material.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

class ConnectivityProvider extends ChangeNotifier {
  ConnectivityProvider() {
    Connectivity().onConnectivityChanged.listen(
      (ConnectivityResult result) async {
        if (result == ConnectivityResult.none) {
          isConnect = false;
        } else {
          isConnect = true;
        }
        notifyListeners();
      },
    );
  }
  bool isConnect = true;
}
