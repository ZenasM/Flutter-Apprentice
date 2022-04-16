import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart';

String apiKey = dotenv.get('API_KEY');
String apiId = dotenv.get('API_ID');
String apiUrl = dotenv.get('API_URL');

class RecipeService {
  Future getData(String url) async {
    print('Calling url: $url');
    final response = await get(Uri.parse(url));
    if (response.statusCode == 200) {
      return response.body;
    } else {
      print(response.statusCode);
    }
  }

  Future<dynamic> getRecipes(String query, int from, int to) async {
    final recipeData = await getData(
        '$apiUrl?app_id=$apiId&app_key=$apiKey&q=$query&from=$from&to=$to');
    return recipeData;
  }
}
