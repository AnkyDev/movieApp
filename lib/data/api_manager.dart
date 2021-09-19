// ignore_for_file: non_constant_identifier_names

import 'dart:convert';

import 'package:bookmyfilm/data/Movie_info.dart';
import 'package:bookmyfilm/data/Video_info.dart';

import 'package:http/http.dart' as http;

class ApiManage {
  final _apiKey = 'd92243df10dd44a91d513d5e9fa1cedc';
  final _baseUrl = "http://api.themoviedb.org/3/movie";
  Future<Welcome> getPopular() async {
    var movieModel;
    try {
      var response =
          await http.get(Uri.parse('$_baseUrl/popular?api_key=$_apiKey'));
      if (response.statusCode == 200) {
        var jsonString = response.body;
        var jsonMap = json.decode(jsonString);
        movieModel = Welcome.fromJson(jsonMap);
      }
    } catch (Exception) {
      return movieModel;
    }
    return movieModel;
  }

  Future<Welcome2> getVideo(String movieId) async {
    var videoModel;
    try {
      var response = await http
          .get(Uri.parse('$_baseUrl/$movieId/videos?api_key=$_apiKey'));
      if (response.statusCode == 200) {
        var jsonString = response.body;
        var jsonMap = json.decode(jsonString);
        videoModel = Welcome2.fromJson(jsonMap);
        print(videoModel.toString());
      }
    } catch (Exception) {
      return videoModel;
    }
    return videoModel;
  }

  Future<Welcome> getTopRated() async {
    var movieModel;
    try {
      var response =
          await http.get(Uri.parse('$_baseUrl/top_rated?api_key=$_apiKey'));
      if (response.statusCode == 200) {
        var jsonString = response.body;
        var jsonMap = json.decode(jsonString);
        movieModel = Welcome.fromJson(jsonMap);
      }
    } catch (Exception) {
      return movieModel;
    }
    return movieModel;
  }

  Future<Welcome> getUpcoming() async {
    var movieModel;
    try {
      var response =
          await http.get(Uri.parse('$_baseUrl/upcoming?api_key=$_apiKey'));
      if (response.statusCode == 200) {
        var jsonString = response.body;
        var jsonMap = json.decode(jsonString);
        movieModel = Welcome.fromJson(jsonMap);
      }
    } catch (Exception) {
      return movieModel;
    }
    return movieModel;
  }

  Future<Welcome> getNowPlaying() async {
    var movieModel;
    try {
      var response =
          await http.get(Uri.parse('$_baseUrl/now_playing?api_key=$_apiKey'));
      if (response.statusCode == 200) {
        var jsonString = response.body;
        var jsonMap = json.decode(jsonString);
        movieModel = Welcome.fromJson(jsonMap);
      }
    } catch (Exception) {
      return movieModel;
    }
    return movieModel;
  }

  Future<Welcome> getSimilarMovies(String movieId) async {
    var movieModel;
    try {
      var response = await http
          .get(Uri.parse('$_baseUrl/$movieId/similar?api_key=$_apiKey'));
      if (response.statusCode == 200) {
        var jsonString = response.body;
        var jsonMap = json.decode(jsonString);
        movieModel = Welcome.fromJson(jsonMap);
        //print(movieModel.toString());
      }
    } catch (Exception) {
      return movieModel;
    }
    return movieModel;
  }
}
