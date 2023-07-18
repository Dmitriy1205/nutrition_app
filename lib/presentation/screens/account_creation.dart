import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nutrition_app/presentation/screens/create_account/first.dart';
import 'package:nutrition_app/presentation/screens/create_account/second.dart';
import 'package:nutrition_app/presentation/screens/create_account/third.dart';
import 'package:nutrition_app/presentation/screens/home/home_screen.dart';

import '../../common/colors.dart';
import '../blocs/create_account/create_account_bloc.dart';
import '../widgets/loading_indicator.dart';

class AccountCreation extends StatefulWidget {
  const AccountCreation({super.key});

  @override
  State<AccountCreation> createState() => _AccountCreationState();
}

class _AccountCreationState extends State<AccountCreation> {
  final _pageController = PageController();
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
      body: BlocConsumer<CreateAccountBloc, CreateAccountState>(
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
              created: (_) => _currentPage == 2
                  ? Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => HomeScreen()))
                  : WidgetsBinding.instance?.addPostFrameCallback((_) {
                _pageController.nextPage(
                  duration: const Duration(milliseconds: 200),
                  curve: Curves.ease,
                );
              }),

              orElse: () {});
        },
        builder: (context, state) {
          return Stack(
            children: [
              Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      const Color(0xFFDEF3F2).withOpacity(0.7),
                      const Color(0xFFD6CFFF).withOpacity(0.7),
                    ],
                    stops: const [
                      0.3,
                      0.9,
                    ],
                    begin: Alignment.bottomLeft,
                    end: Alignment.centerRight,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 60.0),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 30.0),
                      child: Row(
                        children: [
                          AnimatedOpacity(
                            duration: const Duration(milliseconds: 200),
                            opacity: _currentPage == 0 ? 0.0 : 1.0,
                            child: InkWell(
                              borderRadius: BorderRadius.circular(20),
                              child: Ink(
                                width: 20,
                                height: 20,
                                child: const Center(
                                  child: Icon(
                                    Icons.arrow_back_ios,
                                    size: 20,
                                  ),
                                ),
                              ),
                              onTap: () {
                                _pageController.previousPage(
                                    duration:
                                    const Duration(milliseconds: 200),
                                    curve: Curves.ease);
                              },
                            ),
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          Expanded(
                            child: SizedBox(
                              height: 17,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(40),
                                child: LinearProgressIndicator(
                                  value: (_currentPage + 1) / 3,
                                  backgroundColor: AppColors.white,
                                  valueColor:
                                  const AlwaysStoppedAnimation<Color>(
                                      AppColors.violet),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    state.maybeMap(
                      loading: (_) => const LoadingIndicator(),
                      orElse: ()=>Expanded(
                        child: PageView(
                          controller: _pageController,
                          pageSnapping: false,
                          physics: const NeverScrollableScrollPhysics(),
                          children: const [
                            First(),
                            Second(),
                            Third(),
                          ],
                        ),
                      ),),

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
