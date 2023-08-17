import 'package:flutter/material.dart';

import '../../common/colors.dart';
import '../../common/strings.dart';
import '../../common/theme.dart';
import '../screens/subscription_screen.dart';

class SubscriptionLabel extends StatelessWidget {
  const SubscriptionLabel({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.violet,
        borderRadius: BorderRadius.circular(20),
        gradient: const LinearGradient(
          colors: [
            Color(0xFF7E92F8),
            Color(0xFF7F6CFF),
          ],
          stops: [
            0.1,
            0.9,
          ],
          end: Alignment.bottomCenter,
          begin: Alignment.topCenter,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(AppStrings.upgradeToPremium,
                    style: AppTheme.themeData.textTheme.headlineLarge!
                        .copyWith(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.w700)),
                const SizedBox(height: 6),
                Text(AppStrings.enjoyAll,
                    style: AppTheme.themeData.textTheme.headlineLarge!
                        .copyWith(
                            color: Colors.white,
                            fontSize: 14,
                            fontWeight: FontWeight.w400)),
              ],
            ),
            const Icon(
              Icons.arrow_forward_ios_rounded,
              color: Colors.white,
            ),
          ],
        ),
      ),
    );
  }
}
