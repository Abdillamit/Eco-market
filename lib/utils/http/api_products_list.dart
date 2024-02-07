import 'dart:convert';

import 'package:eco_market/modules/products_list.dart';
import 'package:http/http.dart' as http;

class ApiProductsList {
  Future<List<Products>> getProducts(String categoryName) async {
    String url =
        'https://neobook.online/ecobak/product-list/?category_name=$categoryName';

    try {
      final response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        List<dynamic> responseData =
            json.decode(utf8.decode(response.bodyBytes));
        List<Products> products = responseData
            .map((json) => Products.fromJson(json as Map<String, dynamic>))
            .toList();
        return products;
      } else {
        throw Exception('Failed to load data: ${response.statusCode}');
      }
    } catch (error) {
      return [];
    }
  }

  Future<List<Products>> getProducBySearch(String query) async {
    String url = 'https://neobook.online/ecobak/product-list/?search=$query';

    try {
      final response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        List<dynamic> responseData =
            json.decode(utf8.decode(response.bodyBytes));
        List<Products> products = responseData
            .map((json) => Products.fromJson(json as Map<String, dynamic>))
            .toList();
        return products;
      } else {
        throw Exception('Failed to load data: ${response.statusCode}');
      }
    } catch (error) {
      return [];
    }
  }
}
