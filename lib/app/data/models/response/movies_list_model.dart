// To parse this JSON data, do
//
//     final moviesListModel = moviesListModelFromJson(jsonString);

import 'dart:convert';

MoviesListModel moviesListModelFromJson(String str) => MoviesListModel.fromJson(json.decode(str));

String moviesListModelToJson(MoviesListModel data) => json.encode(data.toJson());

class MoviesListModel {
  final List<String>? genres;
  final List<Movie>? movies;

  MoviesListModel({
    this.genres,
    this.movies,
  });

  factory MoviesListModel.fromJson(Map<String, dynamic> json) => MoviesListModel(
    genres: json["genres"] == null ? [] : List<String>.from(json["genres"]!.map((x) => x)),
    movies: json["movies"] == null ? [] : List<Movie>.from(json["movies"]!.map((x) => Movie.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "genres": genres == null ? [] : List<dynamic>.from(genres!.map((x) => x)),
    "movies": movies == null ? [] : List<dynamic>.from(movies!.map((x) => x.toJson())),
  };
}

class Movie {
  final int? id;
  final String? title;
  final String? year;
  final String? runtime;
  final List<String>? genres;
  final String? director;
  final String? actors;
  final String? plot;
  final String? posterUrl;

  Movie({
    this.id,
    this.title,
    this.year,
    this.runtime,
    this.genres,
    this.director,
    this.actors,
    this.plot,
    this.posterUrl,
  });

  factory Movie.fromJson(Map<String, dynamic> json) => Movie(
    id: json["id"],
    title: json["title"],
    year: json["year"],
    runtime: json["runtime"],
    genres: json["genres"] == null ? [] : List<String>.from(json["genres"]!.map((x) => x)),
    director: json["director"],
    actors: json["actors"],
    plot: json["plot"],
    posterUrl: json["posterUrl"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "title": title,
    "year": year,
    "runtime": runtime,
    "genres": genres == null ? [] : List<dynamic>.from(genres!.map((x) => x)),
    "director": director,
    "actors": actors,
    "plot": plot,
    "posterUrl": posterUrl,
  };
}
