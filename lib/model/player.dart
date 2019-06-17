import 'dart:convert';

Player playerFromJson(String str) {
  final jsonData = json.decode(str);
  return Player.fromMap(jsonData);
}

String playerToJson(Player data) {
  final dyn = data.toMap();
  return json.encode(dyn);
}

class Player {
  int id;
  String name;
  int score;

  Player({this.id, this.name, this.score});

  factory Player.fromMap(Map<String, dynamic> json) => new Player(
        id: json["id"],
        name: json["name"],
        score: json["score"],
      );

  Map<String, dynamic> toMap() => {"id": id, "name": name, "score": score};
}
