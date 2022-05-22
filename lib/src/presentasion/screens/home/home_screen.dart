import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:techtest/src/data/models/blog_model.dart';
import 'package:techtest/src/data/models/candidate_model.dart';
import 'package:techtest/src/presentasion/providers/content_provider.dart';
import 'package:techtest/src/presentasion/widgets/card_blog_widget.dart';
import 'package:techtest/src/presentasion/widgets/card_candidate_widget.dart';
import 'package:techtest/src/presentasion/widgets/frame_widget.dart';
import 'package:techtest/src/presentasion/widgets/input_search_widget.dart';
import 'package:techtest/src/presentasion/widgets/loading_linear_widget.dart';

class HomeScreen extends StatelessWidget {
  static const routeName = '/home';
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ContentProvider()),
      ],
      child: const Scaffold(
        body: _HomeBody(),
      ),
    );
  }
}

class _HomeBody extends StatelessWidget {
  const _HomeBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FrameWidget(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          SizedBox(
            height: 24,
          ),
          _HomeSearchBar(),
          SizedBox(
            height: 16,
          ),
          Expanded(
            child: _HomeContent(),
          ),
          SizedBox(
            height: 24,
          ),
        ],
      ),
    );
  }
}

class _HomeSearchBar extends StatelessWidget {
  const _HomeSearchBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: InputSearchWidget(
        hintText: 'Search',
        onChanged: (value) {
          Provider.of<ContentProvider>(context, listen: false)
              .search(keyword: value);
        },
      ),
    );
  }
}

class _HomeContent extends StatefulWidget {
  const _HomeContent({Key? key}) : super(key: key);

  @override
  State<_HomeContent> createState() => _HomeContentState();
}

class _HomeContentState extends State<_HomeContent> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      Provider.of<ContentProvider>(context, listen: false).getList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (Provider.of<ContentProvider>(context, listen: true).isLoading)
            const LoadingLienarWidget(),
          if (!Provider.of<ContentProvider>(context, listen: true).isLoading)
            if (Provider.of<ContentProvider>(context, listen: true)
                .data
                .isNotEmpty)
              ...Provider.of<ContentProvider>(context, listen: true)
                  .data
                  .map((e) {
                if (e is BlogModel) {
                  return CardBlogWidget(blog: e);
                } else if (e is CandidateModel) {
                  return CardCandidateWidget(candidate: e);
                } else {
                  return const SizedBox();
                }
              })
        ],
      ),
    );
  }
}
