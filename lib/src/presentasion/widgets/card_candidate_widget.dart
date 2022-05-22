import 'package:flutter/material.dart';
import 'package:techtest/src/config/colors/app_colors.dart';
import 'package:techtest/src/config/text_style/app_text_style.dart';
import 'package:techtest/src/core/utils/datetime_utils.dart';
import 'package:techtest/src/data/models/candidate_model.dart';
import 'package:techtest/src/presentasion/screens/candidates_detail/candidates_detail_screen.dart';

class CardCandidateWidget extends StatelessWidget {
  final CandidateModel candidate;
  final bool isDetail;
  const CardCandidateWidget({
    Key? key,
    required this.candidate,
    this.isDetail = false,
  }) : super(key: key);

  void _onCardTap(BuildContext context) {
    if (!isDetail) {
      Navigator.pushNamed(
        context,
        CandidatesDetailScreen.routeName,
        arguments: candidate,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _onCardTap(context),
      child: Container(
        padding: EdgeInsets.all(isDetail ? 0 : 16),
        margin: EdgeInsets.all(isDetail ? 0 : 8),
        decoration: BoxDecoration(
          border: isDetail
              ? null
              : Border.all(
                  color: AppColors.defaultBorderColor,
                ),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          children: [
            if (isDetail)
              Center(
                child: Padding(
                  padding: const EdgeInsets.only(
                    bottom: 16,
                  ),
                  child: Column(
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width / 2,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(16),
                          child: Image.network(
                            candidate.photo,
                            fit: BoxFit.fitWidth,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      Text(
                        candidate.name,
                        style: AppTextStyle.headline2.copyWith(
                          color: AppColors.primaryColor,
                        ),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Text(
                        DateTimeUtils.formatFromMicrosecondsSinceEpoch(
                            date: candidate.birthday,
                            dateFormat: 'dd MMM yyyy'),
                        style: AppTextStyle.bodyText1,
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Text(
                        candidate.gender == 'm'
                            ? 'Male'
                            : candidate.gender == 'f'
                                ? 'Female'
                                : '-',
                        style: AppTextStyle.bodyText2,
                      ),
                    ],
                  ),
                ),
              ),
            if (!isDetail)
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 1,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(4),
                      child: Image.network(
                        candidate.photo,
                        fit: BoxFit.fitWidth,
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 16,
                  ),
                  Expanded(
                    flex: 3,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          candidate.name,
                          style: AppTextStyle.headline3.copyWith(
                            color: AppColors.primaryColor,
                          ),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        Text(
                          candidate.gender == 'm'
                              ? 'Male'
                              : candidate.gender == 'f'
                                  ? 'Female'
                                  : '-',
                          style: AppTextStyle.bodyText1,
                        ),
                        const SizedBox(
                          height: 4,
                        ),
                        Text(
                          DateTimeUtils.formatFromMicrosecondsSinceEpoch(
                              date: candidate.birthday,
                              dateFormat: 'dd MMM yyyy'),
                          style: AppTextStyle.bodyText2,
                        ),
                        const SizedBox(
                          height: 24,
                        ),
                        Text(
                          'Expired ' +
                              DateTimeUtils.formatFromMicrosecondsSinceEpoch(
                                  date: candidate.expired,
                                  dateFormat: 'dd/MM/yyyy'),
                          style: AppTextStyle.bodyText2.copyWith(
                            color: AppColors.defaultTextColor.withOpacity(
                              0.8,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
          ],
        ),
      ),
    );
  }
}
