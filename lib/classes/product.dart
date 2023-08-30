import 'dart:convert';

List<Product> productFromJson(String str) => List<Product>.from(json.decode(str).map((x) => Product.fromJson(x)));

String productToJson(List<Product> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Product {
    int id;
    int categoryId;
    String name;
    String description;
    String image;
    String video;
    int status;
    DateTime updatedAt;
    DateTime createdAt;

    Product({
        required this.id,
        required this.categoryId,
        required this.name,
        required this.description,
        required this.image,
        required this.video,
        required this.status,
        required this.updatedAt,
        required this.createdAt,
    });

    factory Product.fromJson(Map<String, dynamic> json) => Product(
        id: json["id"],
        categoryId: json["category_id"],
        name: json["name"],
        description: json["description"],
        image: json["image"],
        video: json["video"],
        status: json["status"],
        updatedAt: DateTime.parse(json["updated_at"]),
        createdAt: DateTime.parse(json["created_at"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "category_id": categoryId,
        "name": name,
        "description": description,
        "image": image,
        "video": video,
        "status": status,
        "updated_at": updatedAt.toIso8601String(),
        "created_at": createdAt.toIso8601String(),
    };
}
