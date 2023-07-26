import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nutrition_app/common/colors.dart';
import 'package:nutrition_app/common/icons.dart';
import 'package:nutrition_app/presentation/blocs/auth/auth_bloc.dart';
import 'package:nutrition_app/presentation/screens/home/profile_screen.dart';
import 'package:nutrition_app/presentation/screens/home/recipe_tab/mood_screen.dart';
import 'package:nutrition_app/presentation/screens/home/recipe_tab/recipe_tab.dart';

import '../../../common/strings.dart';
import '../../../common/theme.dart';
import 'gallery_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;
  final List<Widget> _pages = <Widget>[
    const RecipeTab(),
    GalleryScreen(),
    GalleryScreen(),
    const ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration:  BoxDecoration(
        color: Colors.white,
        gradient: LinearGradient(
          colors: [
            Color(0xFFDEF3F2).withOpacity(0.5),
            Color(0xFFD6CFFF).withOpacity(0.5),
          ],
          stops: [
            0.3,
            0.7,
          ],
          begin: Alignment.bottomLeft,
          end: Alignment.centerRight,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: PreferredSize(
          preferredSize: const Size(double.infinity, 30),
          child: AppBar(
            surfaceTintColor: Colors.transparent,
            shadowColor: Colors.transparent,
            backgroundColor: Colors.transparent,
            actions: [
              Padding(
                padding: const EdgeInsets.only(right: 15.0),
                child: PopupMenuButton(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                    itemBuilder: (context) {
                      return [
                        const PopupMenuItem<int>(
                          value: 0,
                          child: Text(AppStrings.logout),
                        ),
                      ];
                    },
                    onSelected: (value) {
                      if (value == 0) {
                        showAlertDialog(context);
                      }
                    }),
              ),
            ],
          ),
        ),

        body: IndexedStack(
          index: _selectedIndex,
          children: _pages,
        ),
        // body: FloatingNavBar(
        //   borderRadius: 30,
        //   resizeToAvoidBottomInset: true,
        //   color: AppColors.red,
        //   selectedIconColor: Colors.white,
        //   unselectedIconColor: Colors.white.withOpacity(0.6),
        //   items: [
        //     FloatingNavBarItem(
        //       iconData: Icons.person,
        //       title: 'My Profile',
        //       page: const ProfileScreen(),
        //     ),
        //     FloatingNavBarItem(
        //         iconData: Icons.no_food,
        //         title: 'My Recipe',
        //         page: const RecipeScreen()),
        //     FloatingNavBarItem(
        //         iconData: Icons.browse_gallery,
        //         title: 'My Gallery',
        //         page: const GalleryScreen()),
        //   ],
        //   horizontalPadding: 10.0,
        //   hapticFeedback: true,
        //   showTitle: true,
        // ),
        bottomNavigationBar: Container(
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
                topLeft: Radius.circular(15), topRight: Radius.circular(15)),
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
              unselectedItemColor: Colors.black.withOpacity(0.4),
              selectedItemColor: AppColors.violet,
              items: [
                BottomNavigationBarItem(
                  icon: SvgPicture.asset(AppIcons.recipe,color: _selectedIndex == 0 ? AppColors.violet : Colors.black,),
                  label: ''
                ),
                BottomNavigationBarItem(
                  icon: SvgPicture.asset(AppIcons.salat,color: _selectedIndex == 1 ? AppColors.violet : Colors.black,),
                  label: ''
                ),
                BottomNavigationBarItem(
                  icon: SvgPicture.asset(AppIcons.storage,color: _selectedIndex == 2 ? AppColors.violet : Colors.black,),
                  label: ''
                ),
                BottomNavigationBarItem(
                  icon: SvgPicture.asset(AppIcons.profile,color: _selectedIndex == 3 ? AppColors.violet : Colors.black,),
                  label: ''
                ),
              ],
            ),
          ),
        ),
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
        style: AppTheme.themeData.textTheme.bodySmall),
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
