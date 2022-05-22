import 'package:flutter/material.dart';
import 'package:oktoast/oktoast.dart';
import 'package:provider/provider.dart';
import 'package:techtest/src/injector.dart';
import 'package:techtest/src/config/routers/routers.dart';
import 'package:techtest/src/presentasion/providers/conectifity_provider.dart';

void main() async {
  await Injector.initializeDependencies();
  runApp(const MyApp());
  await Injector.dependencies();
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ConnectivityProvider()),
      ],
      child: OKToast(
        child: MaterialApp(
          title: 'techtest',
          routes: Routes.route,
          initialRoute: '/',
        ),
      ),
    );
  }
}
