import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:techtest/src/core/utils/app_utils.dart';

class Injector {
  static Future<void> initializeDependencies() async {
    WidgetsFlutterBinding.ensureInitialized();
    await dotenv.load(fileName: "assets/env/test.env");
  }

  static Future<void> dependencies() async {
    AppUtils.portraitModeOnly();
  }
}
