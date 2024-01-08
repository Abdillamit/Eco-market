import 'dart:convert';

import 'package:eco_market/modules/category_list.dart';
import 'package:http/http.dart' as http;

class ApiCategoryList {
  Future<List<Category>> getCategories() async {
    String url = 'https://neobook.online/ecobak/product-category-list/';

    final response = await http.get(Uri.parse(url));
    try {
      if (response.statusCode == 200) {
        List<dynamic> responseData =
            json.decode(utf8.decode(response.bodyBytes));
        List<Category> categories =
            responseData.map((json) => Category.fromJson(json)).toList();
        return categories;
      } else {
        throw Exception('Failed to load data: ${response.statusCode}');
      }
    } catch (error) {
      print('Error while fetching categories: $error');
      return [];
    }
  }
}
