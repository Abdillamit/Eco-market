import 'package:eco_market/features/personalization/views/home/widgets/cards.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

Future<List<Category>> getCategories() async {
  String url = 'https://neobook.online/ecobak/product-category-list/';
  final response = await http.get(Uri.parse(url));

  var responseData = json.decode(utf8.decode(response.bodyBytes));

  List<Category> categories = [];
  if (response.statusCode == 200) {
    for (var singleCategory in responseData) {
      Category category = Category(
        id: singleCategory['id'],
        name: singleCategory['name'],
        image: singleCategory['image'],
      );

      categories.add(category);
    }
  } else {
    throw Exception('Failed to load data');
  }
  return categories;
}
