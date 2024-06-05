  import 'dart:convert';
  import 'package:http/http.dart' as http;
import 'package:multi_api_app/model/constants.dart';
import 'package:multi_api_app/model/movie/moviemodel.dart';


  class Api {
    static const _trendingUrl =
        'https://api.themoviedb.org/3/trending/movie/day?api_key=${Constants.apiKey}';
    static const _topratedUrl =
        'https://api.themoviedb.org/3/movie/top_rated?api_key=${Constants.apiKey}';
    static const _upcomingUrl =
        'https://api.themoviedb.org/3/movie/upcoming?api_key=${Constants.apiKey}';
        

    
    Future<List<Movie>> getTrendingmovies() async {
      final response = await http.get(Uri.parse(_trendingUrl));
      if (response.statusCode == 200) {
        final decodedData = json.decode(response.body)['results'] as List;
        print(decodedData);
        return decodedData.map((movie) => Movie.fromJson(movie)).toList();
      } else {
        throw Exception("Something went wrong");
      }
    }

    // get data for _topratedUrl//
    Future<List<Movie>> getTopRatedMovies() async {
      final response = await http.get(Uri.parse(_topratedUrl));
      if (response.statusCode == 200) {
        final decodedData = json.decode(response.body)['results'] as List;
        print(decodedData);
        return decodedData.map((movie) => Movie.fromJson(movie)).toList();
      } else {
        throw Exception("Something went wrong");
      }
    }

    // get data for _upcomingUrl//
    Future<List<Movie>> getupcomingMovies() async {
      final response = await http.get(Uri.parse(_upcomingUrl));
      if (response.statusCode == 200) {
        final decodedData = json.decode(response.body)['results'] as List;
        print(decodedData);
        return decodedData.map((movie) => Movie.fromJson(movie)).toList();
      } else {
        throw Exception("Something went wrong");
      }
    }
  }
