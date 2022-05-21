import 'package:flutter/material.dart';
import 'package:techtest/src/presentasion/widgets/frame_widget.dart';

class CandidatesDetailScreen extends StatelessWidget {
  static const routeName = '/candidates-detail';
  const CandidatesDetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: _CandidatesDetailScreenBody(),
    );
  }
}

class _CandidatesDetailScreenBody extends StatelessWidget {
  const _CandidatesDetailScreenBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FrameWidget(
      child: Column(
        children: const [],
      ),
    );
  }
}
