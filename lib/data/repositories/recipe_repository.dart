import 'package:dio/dio.dart';

class RecipeRepository {
  final Dio _dio = Dio(
    BaseOptions(
      baseUrl: 'https://cargo.transport.org.ua',
      validateStatus: (status) => true,
    ),
  );

  Future<void> generateRecipes({
    required String season,
    required List<String> cravings,
    required String currentTime,
    required List<String> exclude,
    required String isSnack,
  }) async {
    const String url = '/cars/trailers/list';

    final Response response = await _dio.get(
      url,
      queryParameters: {
        // 'phone': phone.replaceFirst('+', ''),
      },
    );
  }

  Future<void> getRecipe({
    required String phase,
    required String currentTime,
    required String mood,
    required List<String> exclude,
    required String recipeName,
  }) async {
    const String url = '/cars/trailers/list';

    final Response response = await _dio.get(
      url,
      queryParameters: {
        // 'phone': phone.replaceFirst('+', ''),
      },
    );
  }

  Future<void> getRecipeImage() async {
    const String url = '/cars/trailers/list';

    final Response response = await _dio.get(
      url,
      queryParameters: {
        // 'phone': phone.replaceFirst('+', ''),
      },
    );
  }
}
