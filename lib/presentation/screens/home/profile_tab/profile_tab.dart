import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nutrition_app/presentation/screens/subscription_screen.dart';
import 'package:nutrition_app/presentation/screens/home/profile_tab/my_subscription.dart';
import 'package:nutrition_app/presentation/screens/home/profile_tab/profile_screen.dart';
import 'package:nutrition_app/presentation/screens/policy.dart';
import 'package:nutrition_app/presentation/screens/terms.dart';

import '../../../blocs/mood/mood_bloc.dart';
import 'edit_profile_screen.dart';

class ProfileTab extends StatefulWidget {
  const ProfileTab({super.key});

  @override
  State<ProfileTab> createState() => _ProfileTabState();
}

class _ProfileTabState extends State<ProfileTab> {
  final _pageController = PageController(initialPage: 0);
  int _currentPage = 0;

  @override
  void initState() {
    super.initState();
    _pageController.addListener(() {
      setState(() {
        _currentPage = _pageController.page!.round();
      });
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: BlocBuilder<MoodBloc, MoodState>(
        builder: (context, state) {
          return Column(
            children: [
              const SizedBox(
                height: 30,
              ),
              Expanded(
                child: PageView(
                  controller: _pageController,
                  pageSnapping: false,
                  physics: const NeverScrollableScrollPhysics(),
                  children: [
                    ProfileScreen(
                      nextPage: () {
                        _pageController.nextPage(
                          duration: const Duration(milliseconds: 200),
                          curve: Curves.ease,
                        );
                      },
                      toSubscription: () {
                        _pageController.animateToPage(
                          4,
                          duration: const Duration(milliseconds: 1),
                          curve: Curves.easeInOut,
                        );
                      },
                      toMySubscription: () {
                        _pageController.animateToPage(
                          5,
                          duration: const Duration(milliseconds: 200),
                          curve: Curves.easeInCirc,
                        );
                      },
                    ),
                    EditProfileScreen(
                      previousPage: () {
                        _pageController.previousPage(
                          duration: const Duration(milliseconds: 200),
                          curve: Curves.ease,
                        );
                      },
                    ),
                    PolicyScreen(),
                    TermsScreen(),
                    SubscriptionScreen(
                      previousPage: () {
                        _pageController.jumpToPage(0);
                      },
                    ),
                    MySubscription(previousPage: (){
                      _pageController.jumpToPage(0);
                    }),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
