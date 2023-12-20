import 'dart:convert';
import 'package:eco_market/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class CardPage extends StatelessWidget {
  Future<List<Category>> fetchData() async {
    try {
      final response = await http.get(
          Uri.parse('https://neobook.online/ecobak/product-category-list/'));

      if (response.statusCode == 200) {
        final List<Category> categories =
            (json.decode(utf8.decode(response.bodyBytes)) as List)
                .where((item) => item['image'] != null && item['name'] != null)
                .map((item) => Category.fromJson(item))
                .toList();

        print('Data received: $categories');

        return categories;
      } else {
        print('Failed to load data. Status code: ${response.statusCode}');
        throw Exception('Failed to load data');
      }
    } catch (e) {
      print('Error: $e');
      throw Exception('Error: $e');
    }
  }

  Widget buildGrid(List<Category> categories) {
    return GridView.count(
      padding: const EdgeInsets.all(ASizes.defaultSpace),
      crossAxisCount: 2,
      crossAxisSpacing: 2,
      mainAxisSpacing: 16,
      children: categories.map((category) => buildCard(category)).toList(),
    );
  }

  Widget buildCard(Category category) {
    return ClipRRect(
      child: Stack(
        children: [
          Image.network(category.image, fit: BoxFit.cover),
          Positioned(
            bottom: 0,
            child: Text(
              category.name,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Category>>(
      future: fetchData(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const CircularProgressIndicator();
        } else if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return const Text('No data available');
        } else {
          return buildGrid(snapshot.data!);
        }
      },
    );
  }
}

class Category {
  final int id;
  final String name;
  final String image;

  Category({required this.id, required this.name, required this.image});

  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(
      id: json['id'],
      name: json['name'],
      image: json['image'],
    );
  }
}
