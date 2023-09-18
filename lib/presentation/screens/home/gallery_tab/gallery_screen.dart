import 'dart:io';

import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nutrition_app/data/models/query_recipe/query_recipe.dart';
import 'package:nutrition_app/presentation/blocs/cache/cache_bloc.dart';
import 'package:nutrition_app/presentation/blocs/saved_recipe/saved_recipe_bloc.dart';
import 'package:nutrition_app/presentation/screens/home/gallery_tab/query_recipe_description.dart';

import '../../../../common/colors.dart';
import '../../../../common/strings.dart';
import '../../../../common/theme.dart';
import '../../../../data/local/share_pref.dart';
import '../../../../data/models/saved_recipe/saved_recipe.dart';
import '../../../widgets/app_elevated_button.dart';
import '../../../widgets/app_transparent_button.dart';
import '../../../widgets/colored_container.dart';
import '../../../widgets/custom_expansion_list.dart';
import '../../../widgets/loading_indicator.dart';
import '../../recipe_description.dart';

class GalleryScreen extends StatefulWidget {
  const GalleryScreen({super.key});

  @override
  State<GalleryScreen> createState() => _GalleryScreenState();
}

class _GalleryScreenState extends State<GalleryScreen> {
  // SharedPreferencesHelper sharedPreferencesHelper = SharedPreferencesHelper();
  // List<QueryRecipe> queryRecipe = [];

  @override
  void initState() {
    context.read<SavedRecipeBloc>().add(const SavedRecipeEvent.getRecipes());
    context.read<CacheBloc>().add(const CacheEvent.read());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Padding(
        padding:  EdgeInsets.symmetric(horizontal: Platform.isAndroid ? 0: 10, vertical: 20),
        child: ListView(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: Platform.isAndroid ? 14: 24,),
              child: ExpandablePanel(
                theme: const ExpandableThemeData(
                  hasIcon: false,
                  tapHeaderToExpand: true,
                ),
                header: SizedBox(
                  height: 40,
                  child: ColoredContainer(
                    child: Center(
                      child: FittedBox(
                        fit: BoxFit.scaleDown,
                        child: Text(
                          AppStrings.savedRecipes.toUpperCase(),
                          style: AppTheme.themeData.textTheme.headlineLarge!
                              .copyWith(fontSize: 17),
                        ),
                      ),
                    ),
                  ),
                ),
                expanded: const SizedBox(),
                collapsed: BlocConsumer<SavedRecipeBloc, SavedRecipeState>(
                  listener: (context, state) {
                    state.maybeMap(
                        saved: (_) => context
                            .read<SavedRecipeBloc>()
                            .add(const SavedRecipeEvent.getRecipes()),
                        deleted: (_) => context
                            .read<SavedRecipeBloc>()
                            .add(const SavedRecipeEvent.getRecipes()),
                        orElse: () {});
                  },
                  builder: (context, state) {

                    return state.recipes == null
                        ? SizedBox(
                            height: MediaQuery.of(context).size.height / 2,
                            child: const LoadingIndicator())
                        : state.maybeMap(
                            error: (e) => Center(
                              child: Text(e.error),
                            ),
                            loading: (_) => const LoadingIndicator(),
                            orElse: () =>
                                buildSavedRecipeBody(recipes: state.recipes!),
                          );
                  },
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: Platform.isAndroid ? 14: 24,),
              child: ExpandablePanel(
                theme: const ExpandableThemeData(
                  hasIcon: false,
                  tapHeaderToExpand: true,
                ),
                header: SizedBox(
                  height: 40,
                  child: ColoredContainer(
                    child: Center(
                      child: Text(
                        AppStrings.latestRecipes.toUpperCase(),
                        style: AppTheme.themeData.textTheme.headlineLarge!
                            .copyWith(fontSize: 17),
                      ),
                    ),
                  ),
                ),
                expanded: const SizedBox(),
                collapsed: BlocConsumer<CacheBloc, CacheState>(
                  listener: (context, state) {
                   state.maybeMap(
                     saved: (_)=> context.read<CacheBloc>().add(const CacheEvent.read()),
                       orElse: (){});
                  },
                  builder: (context, state) {

                    return state.queryRecipe == null ? const SizedBox(): state.maybeMap(
                      loading: (_)=> const LoadingIndicator(),
                      orElse: ()=>buildQueryRecipeBody(recipes: state.queryRecipe!),);
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Padding buildSavedRecipeBody({
    required List<SavedRecipe> recipes,
  }) {
    return Padding(
      padding: const EdgeInsets.only(top: 20.0),
      child: GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 25.0,
          mainAxisSpacing: 10.0,
          childAspectRatio: 0.54,
        ),
        itemCount: recipes.length,
        itemBuilder: (context, index) {
          return Center(
            child: GestureDetector(
              onLongPress: () {
                showDeleteBottomSheet(context, recipes[index].id!);
              },
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            RecipeDescription(recipeImage: recipes[index].img!, recipeText:recipes[index].recipeText!,)));
              },
              child: Container(
                height: 278,
                width: 160,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.white, width: 2),
                  borderRadius: BorderRadius.circular(8),
                  color: Colors.transparent,
                ),
                child: Stack(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ClipRRect(
                          borderRadius: const BorderRadius.only(
                              topRight: Radius.circular(8),
                              topLeft: Radius.circular(8)),
                          child: SizedBox(
                            height: 165,
                            width: 160,
                            child: Image.network(
                              recipes[index].img!,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10.0, vertical: 5),
                          child: Text(
                            recipes[index].date ?? '',
                            style: AppTheme.themeData.textTheme.headlineLarge!
                                .copyWith(
                                    fontSize: 10,
                                    fontWeight: FontWeight.w600,
                                    color: AppColors.greu),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                            left: 10.0,
                            right: 15,
                          ),
                          child: Text(
                            recipes[index].name!,
                            overflow: TextOverflow.ellipsis,
                            maxLines: Platform.isAndroid ? 2 : 3,
                            textAlign: TextAlign.start,
                            style: AppTheme.themeData.textTheme.headlineLarge!
                                .copyWith(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600),
                          ),
                        ),
                        SizedBox(height: 5,)
                      ],
                    ),
                    Positioned(
                      top: 2,
                      right: 2,
                      child: GestureDetector(
                        onTap: (){
                          showDeleteBottomSheet(context, recipes[index].id!);
                        },
                        child: Container(
                          width: 40,
                          height: 40,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: AppColors.violet,
                          ),
                          child: const Center(
                            child: Icon(
                              Icons.bookmark,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Padding buildQueryRecipeBody({
    required List<QueryRecipe> recipes,
  }) {
    return Padding(
      padding: const EdgeInsets.only(top: 20.0),
      child: GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 25.0,
          mainAxisSpacing: 10.0,
          childAspectRatio: 0.54,
        ),
        itemCount: recipes.length,
        itemBuilder: (context, index) {
          return Center(
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            QueryRecipeDescription(recipeImage: recipes[index].image!, recipeText: recipes[index].recipeBody!)));
              },
              child: Container(
                height: 278,
                width: 160,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.white, width: 2),
                  borderRadius: BorderRadius.circular(8),
                  color: Colors.transparent,
                ),
                child: SingleChildScrollView(
                  physics: const ClampingScrollPhysics(),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ClipRRect(
                        borderRadius: const BorderRadius.only(
                            topRight: Radius.circular(8),
                            topLeft: Radius.circular(8)),
                        child: SizedBox(
                          height: 165,
                          width: 160,
                          child: Image.network(recipes[index].image!
                            ,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10.0, vertical: 5),
                        child: Text(
                          recipes[index].dateTime!,
                          style: AppTheme.themeData.textTheme.headlineLarge!
                              .copyWith(
                                  fontSize: 10,
                                  fontWeight: FontWeight.w600,
                                  color: AppColors.greu),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          left: 10.0,
                          right: 15,
                        ),
                        child: Text(
                          recipes[index].recipeName!,
                          overflow: TextOverflow.ellipsis,
                          maxLines: Platform.isAndroid ? 2 : 3,
                          textAlign: TextAlign.start,
                          style: AppTheme.themeData.textTheme.headlineLarge!
                              .copyWith(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

showDeleteBottomSheet(BuildContext context, String recipeId) {
  showModalBottomSheet<void>(
    context: context,
    barrierColor: Colors.transparent,
    builder: (BuildContext context) {
      return SizedBox(
        height: Platform.isAndroid ? MediaQuery.of(context).size.height / 2.2 : MediaQuery.of(context).size.height / 2.55,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 24.0, horizontal: 35),
          child: Column(
            children: [
              Container(
                  width: 38,
                  height: 3,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Color(0xff353535))),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 15.0),
                child: Text(AppStrings.deleteFromSaved,
                    style: AppTheme.themeData.textTheme.titleMedium!.copyWith(
                      fontWeight: FontWeight.w700,
                    )),
              ),
              const Divider(
                color: Color(0xFFEEEEEE),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 24.0),
                child: Text(AppStrings.areYouSureDeleteRecipe,
                    style: AppTheme.themeData.textTheme.titleMedium),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 24.0),
                child:Platform.isAndroid ?
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: 139,
                      child: AppTransparentButton(
                          backgroundColor: AppColors.transparentBlue,
                          text: AppStrings.cancel,
                          style: AppTheme.themeData.textTheme.titleMedium!
                              .copyWith(color: AppColors.violet,fontSize: 14),
                          onPressed: () {
                            Navigator.pop(context);
                          }),
                    ),
                    SizedBox(
                      width: 139,
                      child: AppElevatedButton(
                          text: AppStrings.delete,
                          style: AppTheme.themeData.textTheme.titleMedium!
                              .copyWith(color: AppColors.white,fontSize: 14),
                          onPressed: () {
                            context.read<SavedRecipeBloc>().add(
                                SavedRecipeEvent.deleteRecipe(
                                    recipeId: recipeId));
                            Navigator.pop(context);
                          }),
                    ),
                  ],
                ): Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: 159,
                      child: AppTransparentButton(
                          backgroundColor: AppColors.transparentBlue,
                          text: AppStrings.cancel,
                          style: AppTheme.themeData.textTheme.titleMedium!
                              .copyWith(color: AppColors.violet),
                          onPressed: () {
                            Navigator.pop(context);
                          }),
                    ),
                    SizedBox(
                      width: 159,
                      child: AppElevatedButton(
                          text: AppStrings.delete,
                          style: AppTheme.themeData.textTheme.titleMedium!
                              .copyWith(color: AppColors.white),
                          onPressed: () {
                            context.read<SavedRecipeBloc>().add(
                                SavedRecipeEvent.deleteRecipe(
                                    recipeId: recipeId));
                            Navigator.pop(context);
                          }),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
    },
  );
}
