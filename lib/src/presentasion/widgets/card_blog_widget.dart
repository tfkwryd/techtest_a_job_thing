import 'package:flutter/material.dart';
import 'package:techtest/src/config/colors/app_colors.dart';
import 'package:techtest/src/config/text_style/app_text_style.dart';
import 'package:techtest/src/core/utils/datetime_utils.dart';
import 'package:techtest/src/data/models/blog_model.dart';
import 'package:techtest/src/presentasion/screens/blog_detail/blog_detail_screen.dart';

class CardBlogWidget extends StatelessWidget {
  final BlogModel blog;
  final bool isDetail;
  const CardBlogWidget({
    Key? key,
    required this.blog,
    this.isDetail = false,
  }) : super(key: key);

  void _onCardTap(BuildContext context) {
    if (!isDetail) {
      Navigator.pushNamed(
        context,
        BlogDetailScreen.routeName,
        arguments: blog,
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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(4),
              child: Image.network(
                blog.photo,
                fit: BoxFit.fitWidth,
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            Text(
              blog.title,
              style: AppTextStyle.headline3.copyWith(
                color: AppColors.primaryColor,
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            Text(
              DateTimeUtils.formatFromMicrosecondsSinceEpoch(
                  date: blog.createAt, dateFormat: 'dd MMM yyyy'),
              style: AppTextStyle.bodyText2.copyWith(
                color: AppColors.defaultTextColor.withOpacity(
                  0.8,
                ),
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            Text(
              blog.tag,
              style: AppTextStyle.headline4.copyWith(
                color: AppColors.primaryColor,
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            Text(
              isDetail ? blog.content : blog.subTitle,
              style: AppTextStyle.bodyText1,
              textAlign: isDetail ? TextAlign.justify : TextAlign.start,
            ),
            const SizedBox(
              height: 16,
            ),
            Text(
              blog.author,
              style: AppTextStyle.bodyText2,
              textAlign: TextAlign.start,
            ),
          ],
        ),
      ),
    );
  }
}
