import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nutrition_app/common/colors.dart';
import 'package:nutrition_app/data/models/account/account.dart';
import 'package:nutrition_app/presentation/blocs/profile/profile_bloc.dart';
import 'package:nutrition_app/presentation/widgets/colored_container.dart';
import 'package:nutrition_app/presentation/widgets/subscription_label.dart';
import '../../../../common/strings.dart';
import '../../../../common/theme.dart';
import '../../../blocs/auth/auth_bloc.dart';
import '../../../widgets/loading_indicator.dart';

class ProfileScreen extends StatefulWidget {
  final void Function() nextPage;
  final void Function() toSubscription;
  final void Function() toMySubscription;

  const ProfileScreen({
    super.key,
    required this.nextPage,
    required this.toSubscription,
    required this.toMySubscription,
  });

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  late UserAccount user;

  @override
  void initState() {
    user = context.read<ProfileBloc>().state.user!;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: BlocConsumer<ProfileBloc, ProfileState>(
        listener: (context, state) {
          state.maybeMap(
              error: (e) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    backgroundColor: AppColors.red,
                    duration: const Duration(seconds: 5),
                    content: Text(
                      e.error,
                      textAlign: TextAlign.center,
                    ),
                  ),
                );
              },
              orElse: () {});
        },
        builder: (context, state) {
          return state.maybeMap(
            loading: (_) => const LoadingIndicator(),
            orElse: () => Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 34,
              ),
              child: ListView(
                physics: const ClampingScrollPhysics(),
                children: [
                  ColoredContainer(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 7),
                      child: Center(
                        child: Text(
                          AppStrings.profile.toUpperCase(),
                          style: AppTheme.themeData.textTheme.headlineLarge!
                              .copyWith(fontSize: 16),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        AppStrings.nameSurname,
                        style: AppTheme.themeData.textTheme.bodyMedium,
                      ),
                      GestureDetector(
                        onTap: () {
                          widget.nextPage();
                        },
                        child: Text(
                          AppStrings.editProfile,
                          style: AppTheme.themeData.textTheme.titleMedium!
                              .copyWith(color: AppColors.violet),
                        ),
                      ),
                    ],
                  ),
                  Text(
                    user.name!,
                    style: AppTheme.themeData.textTheme.titleMedium,
                  ),
                  const SizedBox(
                    height: 17,
                  ),
                  Text(
                    AppStrings.dateOfBirth,
                    style: AppTheme.themeData.textTheme.bodyMedium,
                  ),
                  Text(
                    user.birthDate!,
                    style: AppTheme.themeData.textTheme.titleMedium,
                  ),
                  const SizedBox(
                    height: 17,
                  ),
                  Text(
                    AppStrings.location,
                    style: AppTheme.themeData.textTheme.bodyMedium,
                  ),
                  Text(
                    '${user.location!.entries.firstWhere((entry) => entry.key == 'name').value}, ${user.location!.entries.firstWhere((entry) => entry.key == 'country').value}',
                    style: AppTheme.themeData.textTheme.titleMedium,
                  ),
                  const SizedBox(
                    height: 17,
                  ),
                  Text(
                    AppStrings.email,
                    style: AppTheme.themeData.textTheme.bodyMedium,
                  ),
                  Text(
                    'email@email.com',
                    style: AppTheme.themeData.textTheme.titleMedium,
                  ),
                  const SizedBox(
                    height: 17,
                  ),
                  user.irregularCycle!
                      ? Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Cycle regularity',
                              style: AppTheme.themeData.textTheme.bodyMedium,
                            ),
                            Text(
                              'Irregular',
                              style: AppTheme.themeData.textTheme.titleMedium,
                            ),
                          ],
                        )
                      : Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              AppStrings.dayCycle,
                              style: AppTheme.themeData.textTheme.bodyMedium,
                            ),
                            Text(
                              user.dayCycle!,
                              style: AppTheme.themeData.textTheme.titleMedium,
                            ),
                            const SizedBox(
                              height: 16,
                            ),
                            Text(
                              AppStrings.cycleLength,
                              style: AppTheme.themeData.textTheme.bodyMedium,
                            ),
                            Text(
                              user.cycleLength!,
                              style: AppTheme.themeData.textTheme.titleMedium,
                            ),
                            const SizedBox(
                              height: 16,
                            ),
                            Text(
                              AppStrings.periodLength,
                              style: AppTheme.themeData.textTheme.bodyMedium,
                            ),
                            Text(
                              user.periodLength!,
                              style: AppTheme.themeData.textTheme.titleMedium,
                            ),
                          ],
                        ),
                  const SizedBox(
                    height: 17,
                  ),
                  user.foodDontIt!.isEmpty ||  user.foodDontIt![0].isEmpty ? const SizedBox() : Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        AppStrings.foodPreferencesShort,
                        style: AppTheme.themeData.textTheme.bodyMedium,
                      ),
                      Text(
                        user.foodDontIt!.join(', '),
                        style: AppTheme.themeData.textTheme.titleMedium,
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 17,
                  ),
                  !user.haveAllergy! ? const SizedBox() : Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        AppStrings.dietaryRestrictionsShort,
                        style: AppTheme.themeData.textTheme.bodyMedium,
                      ),
                      Text(
                        user.allergy!.join(', '),
                        style: AppTheme.themeData.textTheme.titleMedium,
                      ),
                    ],
                  ),

                  const SizedBox(
                    height: 40,
                  ),
                  //TODO: one more gesture for navigiation to my subscriptionPage if user subscribed
                  Column(
                    children: [
                      GestureDetector(
                          onTap: () {
                           widget.toSubscription();

                          },
                          child: const SubscriptionLabel()),
                      const SizedBox(
                        height: 20,
                      ),
                    ],
                  ),

                  ///////////////////////////////             /////////////////////////////////////
                  // const Padding(
                  //   padding: EdgeInsets.symmetric(vertical: 8.0),
                  //   child: Divider(
                  //     color: AppColors.greu,
                  //   ),
                  // ),
                  // GestureDetector(
                  //   onTap: () {
                  //     widget.toMySubscription();
                  //   },
                  //   child: Text(
                  //     AppStrings.mySubscription,
                  //     style: AppTheme.themeData.textTheme.titleMedium,
                  //   ),
                  // ),
                  // const Padding(
                  //   padding: EdgeInsets.symmetric(vertical: 8.0),
                  //   child: Divider(
                  //     color: AppColors.greu,
                  //   ),
                  // ),
                  ///////////////////////////////             /////////////////////////////////////

                  GestureDetector(
                    onTap: () {
                      //TODO: Navigate to terms
                    },
                    child: Text(
                      'Terms of use',
                      style: AppTheme.themeData.textTheme.titleMedium,
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 8.0),
                    child: Divider(
                      color: AppColors.greu,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      //TODO: Navvigate to policy
                    },
                    child: Text(
                      AppStrings.policy,
                      style: AppTheme.themeData.textTheme.titleMedium,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Center(
                    child: GestureDetector(
                      onTap: () {
                        showAlertDialog(context);
                      },
                      child: Text(
                        AppStrings.logout,
                        style: AppTheme.themeData.textTheme.titleMedium!
                            .copyWith(color: AppColors.violet),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

showAlertDialog(BuildContext context) {
  Widget cancelButton = TextButton(
    child: const Text(
      AppStrings.cancel,
      style: TextStyle(color: AppColors.blackBlue),
    ),
    onPressed: () {
      Navigator.pop(context);
    },
  );
  Widget continueButton = TextButton(
    child: const Text(
      AppStrings.logout,
      style: TextStyle(color: AppColors.blackBlue),
    ),
    onPressed: () {
      context.read<AuthBloc>().add(const AuthEvent.logout());
      Navigator.pop(context);
    },
  );

  AlertDialog alert = AlertDialog(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10.0),
    ),
    title: Text(AppStrings.warning,
        style: AppTheme.themeData.textTheme.titleSmall),
    content: Text(AppStrings.areYouSure,
        style: AppTheme.themeData.textTheme.bodySmall!
            .copyWith(color: Colors.black)),
    actions: [
      cancelButton,
      continueButton,
    ],
  );

  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}
