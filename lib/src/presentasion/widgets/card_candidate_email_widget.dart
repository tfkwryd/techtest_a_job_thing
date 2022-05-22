import 'package:flutter/material.dart';
import 'package:techtest/src/config/colors/app_colors.dart';
import 'package:techtest/src/config/text_style/app_text_style.dart';
import 'package:techtest/src/data/models/email_model.dart';
import 'package:url_launcher/url_launcher_string.dart';

class CardCandidateEmailWidget extends StatelessWidget {
  final EmailModel email;
  const CardCandidateEmailWidget({Key? key, required this.email})
      : super(key: key);

  void _launch({
    required String contact,
    required ContactType contactType,
    String defaultMessage = 'Hi i am MK company',
  }) async {
    switch (contactType) {
      case ContactType.wa:
        var _filteredContact = contact
            .replaceAll(RegExp(r"[^\s\w]"), '')
            .replaceAll(RegExp(' '), '');
        var _urlString =
            'https://wa.me/?phone=$_filteredContact&text=$defaultMessage';
        await canLaunchUrlString(
          _urlString,
        ).then((value) {
          if (value) {
            launchUrlString(_urlString);
          }
        });
        break;
      case ContactType.email:
        var _urlString = 'mailto:$contact?body=$defaultMessage';
        await canLaunchUrlString(_urlString).then((value) {
          if (value) {
            launchUrlString(_urlString);
          }
        });
        break;
      default:
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          InkWell(
            onTap: () =>
                _launch(contact: email.phone, contactType: ContactType.email),
            child: Text(
              email.email,
              style: AppTextStyle.headline4
                  .copyWith(color: AppColors.primaryColor),
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          InkWell(
            onTap: () =>
                _launch(contact: email.phone, contactType: ContactType.wa),
            child: Text(
              email.phone,
              style: AppTextStyle.headline4
                  .copyWith(color: AppColors.primaryColor),
            ),
          )
        ],
      ),
    );
  }
}

enum ContactType {
  email,
  wa,
}
