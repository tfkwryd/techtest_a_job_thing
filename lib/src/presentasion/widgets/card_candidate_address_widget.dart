import 'package:flutter/material.dart';
import 'package:techtest/src/config/colors/app_colors.dart';
import 'package:techtest/src/config/text_style/app_text_style.dart';
import 'package:techtest/src/data/models/address_model.dart';

class CardCandidateAddressWidget extends StatelessWidget {
  final AddressModel address;
  const CardCandidateAddressWidget({Key? key, required this.address})
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
            'Address',
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
                      '${address.city}, ${address.city}, ${address.zipCode}',
                      style: AppTextStyle.bodyText1,
                    ),
                    const SizedBox(
                      height: 4,
                    ),
                    Text(
                      address.address,
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
