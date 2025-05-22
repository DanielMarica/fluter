import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

class Film {
  static const baseUrl = "https://sebstreb.github.io/flutter-fiche-5/ghibli-films";

  final String id;
  final String title;
  final String image;
  final String description;
  final String releaseDate;
  final String director;
  final String runningTime;
  final String rtScore;
  final String url;


  const Film({
    required this.id,
    required this.title,
    required this.image,
    required this.description,
    required this.releaseDate,
    required this.director,
    required this.runningTime,
    required this.rtScore,
    required this.url,
  });


  @override
  String toString() {
    return 'Film{id: $id, title: $title, image: $image, description: $description, releaseDate: $releaseDate, director: $director, runningTime: $runningTime, rtScore: $rtScore}';
  }

  static Future<List<Film>> fetchFilms() async {
    var response = await http.get(Uri.parse("$baseUrl/"));

    if (response.statusCode != 200) {
      throw Exception("Error ${response.statusCode} fetching movies");
    }

    return compute((input) {
      final jsonList = jsonDecode(input);
      return jsonList.map<Film>((jsonObj) =>
          Film(
            id: jsonObj["id"],
            title: jsonObj["title"],
            image:jsonObj["image"],
            description: jsonObj["description"],
            releaseDate: jsonObj["release_date"],
            director: jsonObj["director"],
            runningTime: jsonObj["running_time"],
            rtScore: jsonObj["rt_score"],
            url:jsonObj["url"],
          )).toList();
    }, response.body);
  }
}