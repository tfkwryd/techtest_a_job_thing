import 'package:flutter/material.dart';
import 'package:techtest/src/config/colors/app_colors.dart';
import 'package:techtest/src/config/text_style/app_text_style.dart';
import 'package:techtest/src/data/models/candidate_status_model.dart';

class CardCandidateStatusWidget extends StatelessWidget {
  final CandidateStatusModel candidateStatus;
  const CardCandidateStatusWidget({Key? key, required this.candidateStatus})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        border: Border.all(
          color: AppColors.defaultBorderColor,
        ),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Status',
            style: AppTextStyle.headline4,
          ),
          const Divider(
            height: 16,
            color: AppColors.defaultBorderColor,
          ),
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Company Name : ${candidateStatus.companyName}',
                      style: AppTextStyle.bodyText2,
                    ),
                    const SizedBox(
                      height: 4,
                    ),
                    Text(
                      'Industry : ${candidateStatus.industry}',
                      style: AppTextStyle.bodyText2,
                    ),
                    const SizedBox(
                      height: 4,
                    ),
                    Text(
                      'Title : ${candidateStatus.jobTitle}',
                      style: AppTextStyle.bodyText2,
                    ),
                    const SizedBox(
                      height: 4,
                    ),
                    Text(
                      'Status : ${candidateStatus.status}',
                      style: AppTextStyle.bodyText2,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
