import 'dart:convert';
import 'dart:io';
import 'package:intl/intl.dart';
import 'package:path_provider/path_provider.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../models/query_recipe/query_recipe.dart';

class SharedPreferencesHelper {
  static const String _savedRecipesKey = 'saved_recipes_key';
  static const String _queryRecipesKey = 'query_recipes_key';




  Future<String> _saveImageLocally(String imageUrl) async {
    try {
      final appDir = await getApplicationDocumentsDirectory();
      final imageName = 'my_image_${DateTime.now().millisecond}.png';
      final localImagePath = '${appDir.path}/$imageName';

      final imageResponse = await http.get(Uri.parse(imageUrl));
      final imageBytes = imageResponse.bodyBytes;
      final File imageFile = File(localImagePath);
      await imageFile.writeAsBytes(imageBytes);

      return localImagePath;
    } catch (e) {
      throw Exception('Error saving image: $e');
    }
  }


  // Future<void> writeSavedRecipe(String name, String image) async {
  //   await _writeItem(_savedRecipesKey, name, image);
  // }
  //
  // Future<List<Map<String, String>>> readSavedRecipes() async {
  //   return await _readItems(_savedRecipesKey);
  // }

  Future<void> writeQueryRecipe({
    required String name,
    required String image,
    required String recipeBody,
  }) async {
    final prefs = await SharedPreferences.getInstance();
    DateTime currentDate = DateTime.now();
    String formattedDate = DateFormat('d.MM.yyyy').format(currentDate);

    List<QueryRecipe> existingItems = prefs
        .getStringList(_queryRecipesKey)
        ?.map((item) => QueryRecipe.fromJson(jsonDecode(item)))
        .toList() ?? [];

    // Save the image locally and get the path
    String imagePath = await _saveImageLocally(image);

    // Insert the new item at the beginning of the list
    existingItems.insert(
      0,
      QueryRecipe(
        recipeName: name,
        image: imagePath,
        recipeBody: recipeBody,
        dateTime: formattedDate,
      ),
    );

    // Keep a maximum of five items
    if (existingItems.length > 5) {
      // Remove the extra image file
      String imagePathToRemove = existingItems.removeLast().image!;
      if (File(imagePathToRemove).existsSync()) {
        File(imagePathToRemove).deleteSync();
      }
    }

    final List<String> updatedItems =
    existingItems.map((item) => jsonEncode(item.toJson())).toList();

    await prefs.setStringList(_queryRecipesKey, updatedItems);
  }



  Future<List<QueryRecipe>> readQueryRecipes() async {
    final prefs = await SharedPreferences.getInstance();
    final List<String>? items = prefs.getStringList(_queryRecipesKey);

    if (items == null) {
      return [];
    }

    return items.map((item) => QueryRecipe.fromJson(jsonDecode(item))).toList();
  }

// Future<void> _writeItem(
//     String collectionKey, String name, String image) async {
//   final prefs = await SharedPreferences.getInstance();
//
//   final List<Map<String, String>> existingItems = prefs
//       .getStringList(collectionKey)
//       ?.map((item) => jsonDecode(item))
//       .cast<Map<String, String>>() // Cast each item to the correct type
//       .toList() ??
//       [];
//
//   existingItems.add({'name': name, 'image': image});
//
//   final List<String> updatedItems =
//   existingItems.map((item) => jsonEncode(item)).toList();
//
//   await prefs.setStringList(collectionKey, updatedItems);
// }
//
// Future<List<Map<String, String>>> _readItems(String collectionKey) async {
//   final prefs = await SharedPreferences.getInstance();
//   final List<String>? items = prefs.getStringList(collectionKey);
//
//   if (items == null) {
//     return [];
//   }
//
//   return items
//       .map((item) => jsonDecode(item) as Map<String, String>)
//       .toList();
// }
}
