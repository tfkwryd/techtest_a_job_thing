import 'package:flutter/material.dart';
import 'package:techtest/src/data/models/blog_model.dart';
import 'package:techtest/src/presentasion/widgets/card_blog_widget.dart';
import 'package:techtest/src/presentasion/widgets/frame_widget.dart';
import 'package:techtest/src/presentasion/widgets/header_widget.dart';

class BlogDetailScreen extends StatelessWidget {
  static const routeName = '/blog-detail';
  const BlogDetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: _BlogDetailBody(),
    );
  }
}

class _BlogDetailBody extends StatelessWidget {
  const _BlogDetailBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FrameWidget(
      child: Column(
        children: const [
          HeaderWidget(),
          Expanded(
            child: _BlogDetailContent(),
          ),
        ],
      ),
    );
  }
}

class _BlogDetailContent extends StatefulWidget {
  const _BlogDetailContent({Key? key}) : super(key: key);

  @override
  State<_BlogDetailContent> createState() => _BlogDetailContentState();
}

class _BlogDetailContentState extends State<_BlogDetailContent> {
  BlogModel? _blog;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      var _args = ModalRoute.of(context)!.settings.arguments;
      if (_args != null && _args is BlogModel) {
        setState(() {
          _blog = _args;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(24),
      child: Column(
        children: [
          if (_blog != null)
            CardBlogWidget(
              blog: _blog!,
              isDetail: true,
            ),
        ],
      ),
    );
  }
}
