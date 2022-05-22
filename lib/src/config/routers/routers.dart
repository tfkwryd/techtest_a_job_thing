import 'package:techtest/src/presentasion/screens/blog_detail/blog_detail_screen.dart';
import 'package:techtest/src/presentasion/screens/candidates_detail/candidates_detail_screen.dart';
import 'package:techtest/src/presentasion/screens/home/home_screen.dart';
import 'package:techtest/src/presentasion/screens/root.dart';

class Routes {
  static final route = {
    Root.routeName: (context) => const Root(),
    HomeScreen.routeName: (context) => const HomeScreen(),
    BlogDetailScreen.routeName: (context) => const BlogDetailScreen(),
    CandidatesDetailScreen.routeName: (context) =>
        const CandidatesDetailScreen(),
  };
}
