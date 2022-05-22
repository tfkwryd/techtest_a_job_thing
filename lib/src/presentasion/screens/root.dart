import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:techtest/src/presentasion/providers/conectifity_provider.dart';
import 'package:techtest/src/presentasion/screens/errors/error_network_screen.dart';
import 'package:techtest/src/presentasion/screens/home/home_screen.dart';

class Root extends StatelessWidget {
  static const routeName = '/';
  const Root({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (!context.watch<ConnectivityProvider>().isConnect) {
      return const ErrorNetworkScreen();
    } else {
      return const HomeScreen();
    }
  }
}
