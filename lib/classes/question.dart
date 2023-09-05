import 'dart:convert';

List<Question> questionFromJson(String str) =>
    List<Question>.from(json.decode(str).map((x) => Question.fromJson(x)));

String questionToJson(List<Question> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Question {
  int id;
  int productId;
  String question;
  String answer;
  int sort;
  int status;
  DateTime updatedAt;
  DateTime createdAt;

  Question({
    required this.id,
    required this.productId,
    required this.question,
    required this.answer,
    required this.sort,
    required this.status,
    required this.updatedAt,
    required this.createdAt,
  });

  factory Question.fromJson(Map<String, dynamic> json) => Question(
        id: json["id"],
        productId: json["product_id"],
        question: json["question"],
        answer: json["answer"],
        sort: json["sort"],
        status: json["status"],
        updatedAt: DateTime.parse(json["updated_at"]),
        createdAt: DateTime.parse(json["created_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "product_id": productId,
        "question": question,
        "answer": answer,
        "sort": sort,
        "status": status,
        "updated_at": updatedAt.toIso8601String(),
        "created_at": createdAt.toIso8601String(),
      };
}
