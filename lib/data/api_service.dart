import 'dart:convert';

import 'package:http/http.dart' as http;

class ApiService {
  final String trendingMoviesUrl =
      'https://api.themoviedb.org/3/trending/all/day?api_key=79ce9c64e2645e9baff2e363b9869940';

  Future<List?> getTrendingMovies() async {
    http.Response apiResponse = await http.get(Uri.parse(
        'https://api.themoviedb.org/3/trending/movie/day?api_key=79ce9c64e2645e9baff2e363b9869940'));

    try {
      if (apiResponse.statusCode == 200) {
        print('StatusCoded ${apiResponse.statusCode}');
        var response = apiResponse.body;
        var body = jsonDecode(response);
        print('Body $body');
        List data = body['results'];

        return data;
      }
      return null;
    } catch (e) {
      print('Exception $e');
      return null;
    }
  }

  Future<List?> getSearchQuery(String movieName) async {
    http.Response apiResponse = await http.get(Uri.parse(
        'https://api.themoviedb.org/3/search/movie?api_key=79ce9c64e2645e9baff2e363b9869940&query=$movieName'));
    try {
      if (apiResponse.statusCode == 200) {
        var response = apiResponse.body;
        var body = jsonDecode(response);
        print('Cast $body');
        return body['results'];
      }
    } catch (e) {
      print('Exception $e');
    }
  }
}
