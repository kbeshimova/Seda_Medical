import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:seda/classes/question.dart';
import '../classes/news.dart';
import '../classes/category.dart';
import '../classes/product.dart';

// News
Future getNews(int? id) async {
  String result = "";
  var url = Uri.parse(id == null
      ? 'https://bk.all-ll.ru/api/news'
      : 'https://bk.all-ll.ru/api/news/$id');
  var req = http.Request('POST', url);
  var res = await req.send();
  final resBody = await res.stream.bytesToString();
  if (res.statusCode >= 200 && res.statusCode < 300) {
    return result = resBody;
  } else {
    print(res.reasonPhrase);
  }
}

Future<List<News>> newsList() async {
  String res = await getNews(null);
  List<News> news = newsFromJson(res);
  return news;
}

Future<List<News>> oneNews(id) async {
  String res = await getNews(id);
  List<News> news = newsFromJson(res);
  return news;
}

// Category
Future getCategory() async {
  String result = "";
  var url = Uri.parse('https://bk.all-ll.ru/api/category');
  var req = http.Request('POST', url);
  var res = await req.send();
  final resBody = await res.stream.bytesToString();
  if (res.statusCode >= 200 && res.statusCode < 300) {
    print(resBody);
    return result = resBody;
  } else {
    print(res.reasonPhrase);
  }
}

Future<List<Category>> categoryList() async {
  String res = await getCategory();
  List<Category> array = categoryFromJson(res);
  return array;
}

// Product
Future getProductCategory(int categoryId) async {
  String result = "";
  var headersList = {'Content-Type': 'application/x-www-form-urlencoded'};
  var url = Uri.parse('https://bk.all-ll.ru/api/category-product/$categoryId');

  var body = {'name': 'seda-medical', 'pass': 'seda00medical'};

  var req = http.Request('POST', url);
  req.headers.addAll(headersList);
  req.bodyFields = body;
  var res = await req.send();
  final resBody = await res.stream.bytesToString();
  if (res.statusCode >= 200 && res.statusCode < 300) {
    print(resBody);
    return result = resBody;
  } else {
    print(res.reasonPhrase);
  }
}

Future getProduct(int id) async {
  String result = "";
  var headersList = {'Content-Type': 'application/x-www-form-urlencoded'};
  var url = Uri.parse('https://bk.all-ll.ru/api/product/$id');

  var body = {'name': 'seda-medical', 'pass': 'seda00medical'};

  var req = http.Request('POST', url);
  req.headers.addAll(headersList);
  req.bodyFields = body;
  var res = await req.send();
  final resBody = await res.stream.bytesToString();
  if (res.statusCode >= 200 && res.statusCode < 300) {
    print(resBody);
    return result = resBody;
  } else {
    print(res.reasonPhrase);
  }
}

Future<List<Product>> productList(int categoryId) async {
  String res = await getProductCategory(categoryId);
  List<Product> array = productFromJson(res);
  return array;
}

Future<List<Product>> oneProduct(int id) async {
  String res = await getProduct(id);
  List<Product> array = productFromJson(res);
  return array;
}

// Question
// Category
Future getQuestions(int productId) async {
  String result = "";
  var url = Uri.parse('https://bk.all-ll.ru/api/question/$productId}');
  var req = http.Request('POST', url);
  var res = await req.send();
  final resBody = await res.stream.bytesToString();
  if (res.statusCode >= 200 && res.statusCode < 300) {
    print(resBody);
    return result = resBody;
  } else {
    print(res.reasonPhrase);
  }
}

Future<List<Question>> questionList(int productId) async {
  String res = await getQuestions(productId);
  List<Question> array = questionFromJson(res);
  return array;
}

// Picture url
String baseUrl = "https://bk.all-ll.ru/";
String picUrl(String url) {
  List<String> correctUrl = url.split("/");
  String urls = baseUrl;
  urls += "storage";
  for (var i = 0; i < correctUrl.length; i++) {
    if (i != 0) {
      urls += "/${correctUrl[i]}";
    }
  }
  return urls;
}

// Send question
Future sendQuestion(String deviceName, String company, String name,
    String phone, String msg) async {
  var headersList = {'Accept': '*/*', 'Content-Type': 'application/json'};
  var url = Uri.parse(
      'https://sedamedical.okdesk.ru/api/v1/issues/?api_token=f5049b5b38d128e7c95753a8251c8b2849522799');

  var body = {
    "issue": {
      "title": "Вопрос по \"$deviceName\"",
      "description":
          "Имя: $name; Номер телефона: $phone; Компания: $company; Сообщение: $msg;"
    }
  };

  var req = http.Request('POST', url);
  req.headers.addAll(headersList);
  req.body = json.encode(body);

  var res = await req.send();
  final resBody = await res.stream.bytesToString();

  if (res.statusCode >= 200 && res.statusCode < 300) {
    print(resBody);
  } else {
    print(res.reasonPhrase);
  }
}

Future saveToken(String token) async {
  var headersList = {'Content-Type': 'application/x-www-form-urlencoded'};
  var url = Uri.parse('https://bk.all-ll.ru/api/tokens');

  var body = {'token': token};

  var req = http.Request('POST', url);
  req.headers.addAll(headersList);
  req.bodyFields = body;

  var res = await req.send();
  final resBody = await res.stream.bytesToString();

  if (res.statusCode >= 200 && res.statusCode < 300) {
    print(resBody);
  } else {
    print(res.reasonPhrase);
  }
}
