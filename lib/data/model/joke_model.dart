import 'package:flutter/material.dart';

// JokeModel jokeModelFromJson(String str) => JokeModel.fromJson(json.decode(str));

// String jokeModelToJson(JokeModel data) => json.encode(data.toJson());

class JokeModel {
  String setup;
  String delivery;
  int id;

  JokeModel({
    required this.setup,
    required this.delivery,
    required this.id,
  });

  // Map<String, dynamic> toJson() => {
  //       "setup": setup,
  //       "delivery": delivery,
  //       "id": id,
  //     };

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'setup': setup,
      'delivery': delivery,
      'id': id,
    };
  }

  factory JokeModel.fromMap(Map<String, dynamic> map) {
    return JokeModel(
      setup: map['setup'] ?? map['joke'],
      delivery: map['delivery'] ?? 'Not Found',
      id: map['id'] as int,
    );
  }

  // factory JokeModel.fromJson(Map<String, dynamic> json) => JokeModel(
  //       setup: json["setup"] ?? json["joke"],
  //       delivery: json["delivery"] ?? "",
  //       id: json["id"],
  //     );

}
