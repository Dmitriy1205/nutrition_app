import 'dart:convert';
import 'package:nutrition_app/common/exceptions.dart';
import 'package:http/http.dart' as http;
import 'package:nutrition_app/data/models/saved_recipe/saved_recipe.dart';

import '../../common/urls.dart';
import '../models/recipe_collection/recipe_collection.dart';

class RecipeRepository {
  Future<List<String>> generateRecipes({
    required String season,
    required List<String> cravings,
    required String currentTime,
    required List<String> exclude,
  }) async {
    const url = "$apiUrl$recipeList";
    final headers = {'Content-Type': 'application/json'};
    final body = jsonEncode({
      "season": season,
      "cravings": cravings,
      "time_of_the_day": currentTime,
      "exclude": exclude
    });

    try {
      final response =
          await http.post(Uri.parse(url), headers: headers, body: body);

      if (response.statusCode == 200) {
        List<dynamic> data = jsonDecode(response.body);

        List<String> recipeList = data.map((item) => item.toString()).toList();
        return recipeList;
      } else {
        throw BadRequestException(message: 'Failed to load data from API');
      }
    } catch (e) {
      throw BadRequestException(message: e.toString());
    }
  }

  Future<String> getRecipe({
    required String userId,
    required String phase,
    required String timeOfTheDay,
    required String mood,
    required List<String> exclude,
    required String recipeName,
  }) async {
    final url = "$apiUrl$recipeText$userId";
    final headers = {'Content-Type': 'application/json'};
    final body = jsonEncode({
      "phase": phase,
      "time_of_the_day": timeOfTheDay,
      "mood": mood,
      "exclude": exclude,
      "recipe_name": recipeName,
      "no_completion": true,
    });

    try {
      final response =
          await http.post(Uri.parse(url), headers: headers, body: body);

      if (response.statusCode == 200) {

        String recipeText = jsonDecode(response.body);

        return recipeText;
      } else {
        throw BadRequestException(message: 'Failed to load data from API');
      }
    } catch (e) {
      throw BadRequestException(message: e.toString());
    }
  }

  Future<String> getRecipeImage({required String recipeName}) async {
    final url = "$apiUrl$recipeImage$recipeName";
    final headers = {'Content-Type': 'application/json'};

    try {
      final response = await http.post(
        Uri.parse(url),
        headers: headers,
      );

      if (response.statusCode == 200) {
        String recipeImage = jsonDecode(response.body);

        return recipeImage;
      } else {
        throw BadRequestException(message: 'Failed to load data from API');
      }
    } catch (e) {
      throw BadRequestException(message: e.toString());
    }
  }

  Future<String> saveRecipeOnDatabase({
    required String recipeName,
    required String recipeText,
    required String recipeImage,
    required String currentDate,
  }) async {
    const url = "$apiUrl$recipeCollection";
    final headers = {'Content-Type': 'application/json'};

    try {
      final response = await http.post(
        Uri.parse(url),
        headers: headers,
        body: jsonEncode({
          "name": recipeName,
          "text": recipeText,
          "img": recipeImage,
          "date":currentDate,

        }),
      );

      if (response.statusCode == 201) {
        String recipeId = jsonDecode(response.body)['_id'];

        return recipeId;
      } else {
        throw BadRequestException(message: 'Failed to load data from API');
      }
    } catch (e) {
      throw BadRequestException(message: e.toString());
    }
  }

  Future<String> saveRecipeToUserCollection({
    required String currentUserId,
    required String recipeId,
  }) async {
    const url = "$apiUrl$savedRecipeCollection";
    final headers = {'Content-Type': 'application/json'};

    try {
      final response = await http.post(
        Uri.parse(url),
        headers: headers,
        body: jsonEncode({
          "user_id": currentUserId,
          "recipe_id": recipeId,
        }),
      );

      if (response.statusCode == 201) {
        String recipeId = jsonDecode(response.body)['_id'];

        return recipeId;
      } else {
        throw BadRequestException(message: 'Failed to load data from API');
      }
    } catch (e) {
      throw BadRequestException(message: e.toString());
    }
  }

  Future<List<SavedRecipe>> getAllRecipes() async {
    const url = "$apiUrl$recipeCollection";
    final headers = {'Content-Type': 'application/json'};

    try {
      final response = await http.get(
        Uri.parse(url),
        headers: headers,
      );

      if (response.statusCode == 200) {
        List<dynamic> data = jsonDecode(response.body);
        List<SavedRecipe> savedRecipe =
            data.map((e) => SavedRecipe.fromJson(e)).toList();

        return savedRecipe;
      } else {
        throw BadRequestException(message: 'Failed to load data from API');
      }
    } catch (e) {
      throw BadRequestException(message: e.toString());
    }
  }

  Future<List<RecipeCollection>> getSavedRecipesFromUserCollection() async {
    const url = "$apiUrl$savedRecipeCollection";
    final headers = {'Content-Type': 'application/json'};

    try {
      final response = await http.get(
        Uri.parse(url),
        headers: headers,
      );

      if (response.statusCode == 200) {
        List<dynamic> data = jsonDecode(response.body);
        List<RecipeCollection> savedRecipe =
            data.map((e) => RecipeCollection.fromJson(e)).toList();

        return savedRecipe;
      } else {
        throw BadRequestException(message: 'Failed to load data from API');
      }
    } catch (e) {
      throw BadRequestException(message: e.toString());
    }
  }

  Future<void> deleteFromSavedRecipeCollection(
      {required String savedRecipeId}) async {
    final url = "$apiUrl$savedRecipeCollection$savedRecipeId";
    final headers = {'Content-Type': 'application/json'};

    try {
      final response = await http.delete(
        Uri.parse(url),
        headers: headers,
      );

      if (response.statusCode == 204) {
        print('deleted');
      } else {
        throw BadRequestException(message: 'Failed to load data from API');
      }
    } catch (e) {
      throw BadRequestException(message: e.toString());
    }
  }

  Future<void> deleteFromRecipeCollection({required String recipeId}) async {
    final url = "$apiUrl$recipeCollection$recipeId";
    final headers = {'Content-Type': 'application/json'};

    try {
      final response = await http.delete(
        Uri.parse(url),
        headers: headers,
      );

      if (response.statusCode == 204) {
        print('deleted');
      } else {
        throw BadRequestException(message: 'Failed to load data from API');
      }
    } catch (e) {
      throw BadRequestException(message: e.toString());
    }
  }

// Future<List<RecipeCollection>> getAllRecipesQuery() async {
//   const url = "$apiUrl$recipeQuery";
//   final headers = {'Content-Type': 'application/json'};
//
//   try {
//     final response = await http.get(
//       Uri.parse(url),
//       headers: headers,
//     );
//
//     if (response.statusCode == 200) {
//       List<dynamic> data = jsonDecode(response.body);
//       List<RecipeCollection> savedRecipe = data.map((e) =>
//           RecipeCollection.fromJson(e)).toList();
//
//       return savedRecipe;
//     } else {
//       throw BadRequestException(message: 'Failed to load data from API');
//     }
//   } catch (e) {
//     throw BadRequestException(message: e.toString());
//   }
// }
}
// final Dio _dio = Dio(
//   BaseOptions(
//     baseUrl: 'http://13.48.84.42',
//     followRedirects: true,
//     validateStatus: (status) { return status!<500; },
//     maxRedirects: 5,
//   ),
// )..interceptors.add(LogInterceptor(requestBody: true, responseBody: true));

// Future<List<String>> generateRecipes({
//   required String season,
//   required List<String> cravings,
//   required String currentTime,
//   required List<String> exclude,
// }) async {
//   const String url = '/recipe_list/';
//
//   final body = jsonEncode({
//     "season": season,
//     "cravings": cravings,
//     "time_of_the_day": currentTime,
//     "exclude": exclude
//   });
//
//
//   try {
//     final Response response = await _dio.post(
//       url,
//       data:body ,
//       options: Options(contentType: 'application/json'),
//
//     );
//
//     if (response.statusCode == 200) {
//       // List<String> data = jsonDecode(response.data);
//
//       List<String> recipeList = jsonDecode(response.data).map((item) => item.toString()).toList();
//       return recipeList;
//     } else {
//       throw BadRequestException(message: 'Failed to load data from API');
//     }
//   } catch (e) {
//     throw BadRequestException(message: e.toString());
//   }
// }
