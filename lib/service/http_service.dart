import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:flutter_http_request_and_rest_api/models/movie.dart';


class HttpService {
   final String apiKey = '34a2a9f98a769af23824cccff6dd5370';
   final String baseUrl = 'https://api.themoviedb.org/3/movie/popular?api_key=';
   final String upUrl = 'https://api.themoviedb.org/3/movie/upcoming?api_key=';

Future<List?> getPopularMovies() async {
  final String uri = baseUrl + apiKey;

  http.Response result = await http.get(Uri.parse(uri));
  if (result.statusCode == HttpStatus.ok){
    // print("Succes ");
    final jsonResponse = json.decode(result.body);
    final moviesMap = jsonResponse['results'];
    List movies = moviesMap.map((i) => Movie.fromJson(i)).toList();
    return movies;
  } else {
    // print("Gagal");
    return null;
  }
}

Future<List?> getUpcomingMovies() async {
  final String uri = upUrl + apiKey;

  http.Response result = await http.get(Uri.parse(uri));
  if (result.statusCode == HttpStatus.ok){
    // print("Succes ");
    final jsonResponse = json.decode(result.body);
    final moviesMap = jsonResponse['results'];
    List movies2 = moviesMap.map((i) => Movie.fromJson(i)).toList();
    return movies2;
  } else {
    // print("Gagal");
    return null;
  }
}
  
}