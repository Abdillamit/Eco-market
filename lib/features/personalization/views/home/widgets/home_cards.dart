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
        final List<dynamic> data = json.decode(utf8.decode(response.bodyBytes));

        print('Data received: $data');

        return data
            .map((item) => Category.fromJson(item))
            .where(
                (category) => category.image != null && category.name != null)
            .toList();
      } else {
        print('Failed to load data. Status code: ${response.statusCode}');
        throw Exception('Failed to load data');
      }
    } catch (e) {
      print('Error: $e');
      throw Exception('Error: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Category>>(
      future: fetchData(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return CircularProgressIndicator();
        } else if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return Text('No data available');
        } else {
          return GridView.count(
            padding: const EdgeInsets.all(ASizes.defaultSpace),
            crossAxisCount: 2,
            crossAxisSpacing: 2,
            mainAxisSpacing: 16,
            children: snapshot.data!.map((category) {
              return ClipRRect(
                child: Stack(
                  children: [
                    Image.network(category.image, fit: BoxFit.cover),
                    Positioned(
                      bottom: 0,
                      left: 0,
                      child: Container(
                        padding: const EdgeInsets.all(ASizes.sm),
                        child: Text(
                          category.name,
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              );
            }).toList(),
          );
        }
      },
    );
  }
}

@override
Widget build(BuildContext context) {
  return FutureBuilder<List<Category>>(
    future: fetchData(),
    builder: (context, snapshot) {
      if (snapshot.connectionState == ConnectionState.waiting) {
        return CircularProgressIndicator();
      } else if (snapshot.hasError) {
        return Text('Error: ${snapshot.error}');
      } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
        return Text('No data available');
      } else {
        return GridView.count(
          padding: const EdgeInsets.all(ASizes.defaultSpace),
          crossAxisCount: 2,
          crossAxisSpacing: 2,
          mainAxisSpacing: 16,
          children: snapshot.data!.map((category) {
            return ClipRRect(
              child: Stack(
                children: [
                  Image.network(category.image, fit: BoxFit.cover),
                  Positioned(
                    bottom: 0,
                    left: 0,
                    child: Container(
                      padding: const EdgeInsets.all(ASizes.sm),
                      child: Text(
                        category.name,
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          }).toList(),
        );
      }
    },
  );
}

fetchData() {}

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
