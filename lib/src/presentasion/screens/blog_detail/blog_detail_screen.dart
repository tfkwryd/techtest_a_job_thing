import 'package:flutter/material.dart';
import 'package:techtest/src/presentasion/widgets/frame_widget.dart';

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
        children: const [],
      ),
    );
  }
}
