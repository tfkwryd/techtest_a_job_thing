import 'package:flutter/material.dart';
import 'package:techtest/src/presentasion/widgets/frame_widget.dart';

class ErrorNetworkScreen extends StatelessWidget {
  static const routeName = '/error-network';
  const ErrorNetworkScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: _ErrorNetworkBody(),
    );
  }
}

class _ErrorNetworkBody extends StatelessWidget {
  const _ErrorNetworkBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FrameWidget(
      child: Center(
        child: SingleChildScrollView(
          child: Column(
            children: const [
              Text(
                'Network Error',
              ),
              Text(
                'Please check your connection',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
