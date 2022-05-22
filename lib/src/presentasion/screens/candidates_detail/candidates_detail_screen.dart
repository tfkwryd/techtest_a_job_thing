import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:techtest/src/data/models/candidate_model.dart';
import 'package:techtest/src/presentasion/providers/candidates_detail_provider.dart';
import 'package:techtest/src/presentasion/widgets/card_candidate_address_widget.dart';
import 'package:techtest/src/presentasion/widgets/card_candidate_email_widget.dart';
import 'package:techtest/src/presentasion/widgets/card_candidate_status_widget.dart';
import 'package:techtest/src/presentasion/widgets/card_candidate_widget.dart';
import 'package:techtest/src/presentasion/widgets/frame_widget.dart';
import 'package:techtest/src/presentasion/widgets/header_widget.dart';
import 'package:techtest/src/presentasion/widgets/loading_linear_widget.dart';

class CandidatesDetailScreen extends StatelessWidget {
  static const routeName = '/candidates-detail';
  const CandidatesDetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => CandidatesDetailProvider()),
        ],
        child: const _CandidatesDetailScreenBody(),
      ),
    );
  }
}

class _CandidatesDetailScreenBody extends StatelessWidget {
  const _CandidatesDetailScreenBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FrameWidget(
      child: Column(
        children: const [
          HeaderWidget(),
          Expanded(
            child: _CandidateDetailContent(),
          ),
        ],
      ),
    );
  }
}

class _CandidateDetailContent extends StatefulWidget {
  const _CandidateDetailContent({Key? key}) : super(key: key);

  @override
  State<_CandidateDetailContent> createState() =>
      _CandidateDetailContentState();
}

class _CandidateDetailContentState extends State<_CandidateDetailContent> {
  CandidateModel? _candidate;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      var _args = ModalRoute.of(context)!.settings.arguments;
      if (_args != null && _args is CandidateModel) {
        setState(() {
          _candidate = _args;
        });
        Provider.of<CandidatesDetailProvider>(context, listen: false)
            .getDetail(id: _args.id);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (_candidate != null)
            CardCandidateWidget(
              candidate: _candidate!,
              isDetail: true,
            ),
          if (Provider.of<CandidatesDetailProvider>(context, listen: true)
              .isLoading)
            const LoadingLienarWidget(),
          if (Provider.of<CandidatesDetailProvider>(context, listen: true)
                  .candidateStatus !=
              null)
            Padding(
              padding: const EdgeInsets.only(
                top: 8,
              ),
              child: CardCandidateStatusWidget(
                candidateStatus:
                    Provider.of<CandidatesDetailProvider>(context, listen: true)
                        .candidateStatus!,
              ),
            ),
          if (Provider.of<CandidatesDetailProvider>(context, listen: true)
                  .address !=
              null)
            Padding(
              padding: const EdgeInsets.only(
                top: 8,
              ),
              child: CardCandidateAddressWidget(
                address:
                    Provider.of<CandidatesDetailProvider>(context, listen: true)
                        .address!,
              ),
            ),
          if (Provider.of<CandidatesDetailProvider>(context, listen: true)
                  .email !=
              null)
            Padding(
              padding: const EdgeInsets.only(
                top: 8,
              ),
              child: CardCandidateEmailWidget(
                email:
                    Provider.of<CandidatesDetailProvider>(context, listen: true)
                        .email!,
              ),
            ),
          const SizedBox(
            height: 48,
          ),
        ],
      ),
    );
  }
}
