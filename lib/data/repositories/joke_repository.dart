import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../model/joke_model.dart';

class JokeRepository {
  final String _baseUrl = "https://v2.jokeapi.dev/joke/Any";

  Future<JokeModel> getJoke() async {
    final response = await http.get(Uri.parse(_baseUrl));
    if (response.statusCode == 200) {
      // return jokeModelFromJson(response.body);
      return JokeModel.fromMap(jsonDecode(response.body));
    } else {
      throw Exception("Failed to load joke");
    }
  }
}
