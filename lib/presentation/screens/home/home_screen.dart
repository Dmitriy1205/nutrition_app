import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nutrition_app/common/colors.dart';
import 'package:nutrition_app/common/icons.dart';
import 'package:nutrition_app/presentation/blocs/auth/auth_bloc.dart';
import 'package:nutrition_app/presentation/blocs/tutorial/tutorial_bloc.dart';
import 'package:nutrition_app/presentation/screens/home/phase_tab/phase_screen.dart';
import 'package:nutrition_app/presentation/screens/home/profile_screen.dart';
import 'package:nutrition_app/presentation/screens/home/recipe_tab/recipe_tab.dart';
import 'package:nutrition_app/presentation/widgets/loading_indicator.dart';

import '../../../common/strings.dart';
import '../../../common/theme.dart';
import '../../blocs/profile/profile_bloc.dart';
import 'gallery_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;
  bool? isBottomBar;
  final List<Widget> _pages = <Widget>[
    const RecipeTab(),
    PhaseScreen(),
    GalleryScreen(),
    const ProfileScreen(),
  ];

  @override
  void initState() {
    context.read<TutorialBloc>().add(const TutorialEvent.getTutorial());

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<TutorialBloc, TutorialState>(
        listener: (context, state) {
          state.maybeMap(
              loaded: (_) {
                setState(() {
                  isBottomBar = context.read<TutorialBloc>().state.tutorial!.isShowBottomBar;
                });
              },
              orElse: () {});
        },
      child: BlocBuilder<ProfileBloc, ProfileState>(

        builder: (context, state) {
          return state.maybeMap(
              loading: (_) => Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                  gradient: LinearGradient(
                    colors: [
                      Color(0xFFDEF3F2),
                      Color(0xFFD6CFFF),
                    ],
                    stops: [
                      0.3,
                      0.9,
                    ],
                    begin: Alignment.bottomLeft,
                    end: Alignment.centerRight,
                  ),
                ),
                child: const Scaffold(
                    backgroundColor: Colors.transparent,
                    body: LoadingIndicator()),
              ),
              orElse: () {
                if(isBottomBar == null){
                  return Container(
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      gradient: LinearGradient(
                        colors: [
                          Color(0xFFDEF3F2),
                          Color(0xFFD6CFFF),
                        ],
                        stops: [
                          0.3,
                          0.9,
                        ],
                        begin: Alignment.bottomLeft,
                        end: Alignment.centerRight,
                      ),
                    ),
                    child: const Scaffold(
                        backgroundColor: Colors.transparent,
                        body: LoadingIndicator()),
                  );
                }
                else{
                  isBottomBar = context
                      .read<TutorialBloc>()
                      .state
                      .tutorial!
                      .isShowBottomBar;
                }

                return
                  DecoratedBox(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      gradient: LinearGradient(
                        colors: [
                          const Color(0xFFDEF3F2).withOpacity(0.5),
                          const Color(0xFFD6CFFF).withOpacity(0.5),
                        ],
                        stops: const [
                          0.3,
                          0.7,
                        ],
                        begin: Alignment.bottomLeft,
                        end: Alignment.centerRight,
                      ),
                    ),
                    child: Scaffold(
                      backgroundColor: Colors.transparent,
                      // appBar: PreferredSize(
                      //   preferredSize: const Size(double.infinity, 30),
                      //   child: AppBar(
                      //     systemOverlayStyle: SystemUiOverlayStyle(
                      //       statusBarColor: Colors.green, // <-- SEE HERE
                      //       statusBarIconBrightness: Brightness.dark, //<-- For Android SEE HERE (dark icons)
                      //       statusBarBrightness: Brightness.dark, //<-- For iOS SEE HERE (dark icons)
                      //     ),
                      //     surfaceTintColor: Colors.transparent,
                      //     shadowColor: Colors.transparent,
                      //     backgroundColor: Colors.transparent,
                      //     actions: [
                      //       Padding(
                      //         padding: const EdgeInsets.only(right: 15.0),
                      //         child:
                      //
                      //       ),
                      //     ],
                      //   ),
                      // ),
                      body: IndexedStack(
                        index: _selectedIndex,
                        children: _pages,
                      ),
                      bottomNavigationBar: AnimatedOpacity(
                        opacity: !isBottomBar! ? 1.0 : 0,
                        duration: const Duration(seconds: 1),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(15.0),
                              topRight: Radius.circular(15.0),
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.3),
                                spreadRadius: 2,
                                blurRadius: 7,
                                offset: const Offset(0, -3),
                              ),
                            ],
                          ),
                          child: ClipRRect(
                            borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(15),
                                topRight: Radius.circular(15)),
                            child: BottomNavigationBar(
                              type: BottomNavigationBarType.fixed,
                              showSelectedLabels: false,
                              showUnselectedLabels: false,
                              enableFeedback: false,
                              backgroundColor: AppColors.white,
                              currentIndex: _selectedIndex,
                              onTap: (index) {
                                setState(() {
                                  _selectedIndex = index;
                                });
                              },
                              unselectedItemColor: Colors.black.withOpacity(
                                  0.4),
                              selectedItemColor: AppColors.violet,
                              items: [
                                BottomNavigationBarItem(
                                    icon: SvgPicture.asset(
                                      AppIcons.recipe,
                                      color: _selectedIndex == 0
                                          ? AppColors.violet
                                          : Colors.black,
                                    ),
                                    label: ''),
                                BottomNavigationBarItem(
                                    icon: SvgPicture.asset(
                                      AppIcons.salat,
                                      color: _selectedIndex == 1
                                          ? AppColors.violet
                                          : Colors.black,
                                    ),
                                    label: ''),
                                BottomNavigationBarItem(
                                    icon: SvgPicture.asset(
                                      AppIcons.storage,
                                      color: _selectedIndex == 2
                                          ? AppColors.violet
                                          : Colors.black,
                                    ),
                                    label: ''),
                                BottomNavigationBarItem(
                                    icon: SvgPicture.asset(
                                      AppIcons.profile,
                                      color: _selectedIndex == 3
                                          ? AppColors.violet
                                          : Colors.black,
                                    ),
                                    label: ''),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
              });
        },
      ),
    );
  }
}


