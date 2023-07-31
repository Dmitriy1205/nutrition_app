import 'dart:convert';
import 'package:nutrition_app/common/exceptions.dart';
import 'package:http/http.dart' as http;

import '../../common/urls.dart';

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
