import 'package:http/http.dart' as http;
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
    print(resBody);
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
  var url = Uri.parse('https://bk.all-ll.ru/api/category-product/$categoryId');
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

Future getProduct(int id) async {
  String result = "";
  var url = Uri.parse('https://bk.all-ll.ru/api/product/$id');
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
