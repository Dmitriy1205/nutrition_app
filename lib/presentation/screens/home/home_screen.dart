import 'package:floating_navbar/floating_navbar.dart';
import 'package:floating_navbar/floating_navbar_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nutrition_app/common/colors.dart';
import 'package:nutrition_app/presentation/blocs/auth/auth_bloc.dart';
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          context.read<AuthBloc>().state.user!.email ?? '',
          style: AppTheme.themeData.textTheme.displayMedium,
        ),
        actions: [
          const Text('Logout'),
          IconButton(
            onPressed: () {
              showAlertDialog(context);
            },
            icon: const Icon(Icons.logout),
          ),
        ],
      ),
      backgroundColor: AppColors.background,
      body: Padding(
        padding: const EdgeInsets.only(bottom: 25),
        child: FloatingNavBar(
          borderRadius: 30,
          resizeToAvoidBottomInset: true,
          color: AppColors.red,
          selectedIconColor: Colors.white,
          unselectedIconColor: Colors.white.withOpacity(0.6),
          items: [
            FloatingNavBarItem(
              iconData: Icons.person,
              title: 'My Profile',
              page: const ProfileScreen(),
            ),
            FloatingNavBarItem(
                iconData: Icons.no_food,
                title: 'My Recipe',
                page: const RecipeScreen()),
            FloatingNavBarItem(
                iconData: Icons.browse_gallery,
                title: 'My Gallery',
                page: const GalleryScreen()),
          ],
          horizontalPadding: 30.0,
          hapticFeedback: true,
          showTitle: true,
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
