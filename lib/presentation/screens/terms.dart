import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../common/strings.dart';
import '../../common/theme.dart';

class TermsScreen extends StatelessWidget {
  const TermsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding:
        const EdgeInsets.only(left: 34, right: 34, bottom: 34, top: 34),
        child: ListView(
          children: [
            Align(
              alignment: Alignment.topRight,
              child: InkWell(
                borderRadius: BorderRadius.circular(20),
                child: Ink(
                  width: 20,
                  height: 20,
                  child: const Center(
                    child: Icon(
                      Icons.close,
                      size: 22,
                    ),
                  ),
                ),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
            ),
            const SizedBox(
              height: 14,
            ),
            Text(
              AppStrings.terms,
              style: AppTheme.themeData.textTheme.headlineLarge,
            ),const SizedBox(
              height: 24,
            ),

            RichText(
              text: TextSpan(

                children: [
                  TextSpan(
                    text: 'General information\n\n',
                    style: AppTheme
                        .themeData.textTheme.titleMedium,

                  ),
                  TextSpan(
                    text: '''We are not lawyers nor a law firm, but we help you with compliance in relation to your privacy and contractual obligations. We provide you a software (the “Software”), that you access remotely via the cloud, that you can use for (a) consent management (“Consent Platform”); and (b) the generation of policies, legal agreements, disclaimers, and other documents generated by the Services using information related to your business or organization that you enter into the Software (collectively “Forms”).''',
                    style: AppTheme
                        .themeData.textTheme.titleSmall,),

                ],
              ),
            ),
            const SizedBox(
              height: 24,
            ),

            RichText(
              text: TextSpan(

                children: [
                  TextSpan(
                    text: 'General information\n\n',
                    style: AppTheme
                        .themeData.textTheme.titleMedium,

                  ),
                  TextSpan(
                    text: '''We are not lawyers nor a law firm, but we help you with compliance in relation to your privacy and contractual obligations. We provide you a software (the “Software”), that you access remotely via the cloud, that you can use for (a) consent management (“Consent Platform”); and (b) the generation of policies, legal agreements, disclaimers, and other documents generated by the Services using information related to your business or organization that you enter into the Software (collectively “Forms”).''',
                    style: AppTheme
                        .themeData.textTheme.titleSmall,),

                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}