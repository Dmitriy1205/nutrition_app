import 'package:floating_navbar/floating_navbar.dart';
import 'package:floating_navbar/floating_navbar_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nutrition_app/common/colors.dart';
import 'package:nutrition_app/presentation/blocs/auth/auth_bloc.dart';
import 'package:nutrition_app/presentation/blocs/user/user_bloc.dart';
import 'package:nutrition_app/presentation/screens/home/profile_screen.dart';
import 'package:nutrition_app/presentation/screens/home/recipe_screen.dart';

import '../../../common/strings.dart';
import '../../../common/theme.dart';
import 'gallery_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 1;
  final List<Widget> _pages = <Widget>[
   const ProfileScreen(),
    RecipeScreen(),
     GalleryScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size(double.infinity,30),
        child: AppBar(
          backgroundColor: AppColors.background,
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
      backgroundColor: AppColors.background,
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
            topLeft: Radius.circular(30.0),
            topRight: Radius.circular(30.0),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 2,
              blurRadius: 5,
              offset: const Offset(0, -3),
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(30),
          child: BottomNavigationBar(
            backgroundColor: AppColors.red,
            currentIndex: _selectedIndex,
            onTap: (index) {
              setState(() {
                _selectedIndex = index;
              });
            },
            unselectedItemColor: Colors.white.withOpacity(0.4),
            selectedItemColor:Colors.white,
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.person),
                label: 'My Profile',
              ),
              BottomNavigationBarItem(
                icon: Icon(
                    Icons.no_food
                ),
                label: 'My Recipe',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.browse_gallery),
                label: 'My Gallery',
              ),
            ],
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
