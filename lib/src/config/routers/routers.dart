import 'package:techtest/src/presentasion/screens/home/home_screen.dart';
import 'package:techtest/src/presentasion/screens/root.dart';

class Routes {
  static final route = {
    Root.routeName: (context) => const Root(),
    HomeScreen.routeName: (context) => const HomeScreen(),
  };
}
