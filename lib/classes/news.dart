import 'dart:convert';

List<News> newsFromJson(String str) =>
    List<News>.from(json.decode(str).map((x) => News.fromJson(x)));

String newsToJson(List<News> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class News {
  int id;
  String name;
  String description;
  String author;
  String image;
  int status;
  DateTime updatedAt;
  DateTime createdAt;

  News({
    required this.id,
    required this.name,
    required this.description,
    required this.author,
    required this.image,
    required this.status,
    required this.updatedAt,
    required this.createdAt,
  });

  factory News.fromJson(Map<String, dynamic> json) => News(
        id: json["id"] ?? "",
        name: json["name"] ?? "",
        description: json["description"] ?? "",
        author: json["author"] ?? "Seda Medical",
        image: json["image"] ?? "",
        status: json["status"] ?? "1",
        updatedAt: DateTime.parse(json["updated_at"]),
        createdAt: DateTime.parse(json["created_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "description": description,
        "author": author,
        "image": image,
        "status": status,
        "updated_at": updatedAt.toIso8601String(),
        "created_at": createdAt.toIso8601String(),
      };
}
