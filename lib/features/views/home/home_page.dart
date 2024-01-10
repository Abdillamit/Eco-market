import 'dart:convert';

import 'package:eco_market/utils/constants/text_strings.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Future<List<Category>> getCategories() async {
      try {
        final response = await http.get(
            Uri.parse('https://neobook.online/ecobak/product-category-list/'));

        if (response.statusCode == 200) {
          final List<dynamic> data =
              json.decode(utf8.decode(response.bodyBytes));

          return data
              .map((item) => Category.fromJson(item))
              .where(
                  (category) => category.image != null && category.name != null)
              .toList();
        } else {
          throw Exception('Failed to load data');
        }
      } catch (e) {
        throw Exception('Error: $e');
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          ATexts.appBarTitle,
          style: TextStyle(
            color: Color(0xFF1F1F1F),
            fontFamily: 'TTNormsPro',
            fontSize: 24.0,
            fontStyle: FontStyle.normal,
            fontWeight: FontWeight.w700,
            height: 1.0,
          ),
        ),
        centerTitle: true,
      ),
      body: FutureBuilder(
        future: getCategories(),
        builder:
            (BuildContext context, AsyncSnapshot<List<Category>> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text('Error: ${snapshot.error}'),
            );
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(
              child: Text('No categories found'),
            );
          } else {
            return GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 16.0,
                mainAxisSpacing: 16.0,
              ),
              padding: const EdgeInsets.all(16),
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {},
                  child: Stack(
                    alignment: Alignment.bottomLeft,
                    children: [
                      Positioned.fill(
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: ColorFiltered(
                            colorFilter: ColorFilter.mode(
                              Colors.black.withOpacity(0.3),
                              BlendMode.srcOver,
                            ),
                            child: Image.network(
                              '${snapshot.data![index].image}',
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10),
                        child: Text(
                          '${snapshot.data![index].name}',
                          style: const TextStyle(
                            color: Colors.white,
                            fontFamily: 'TTNormsPro',
                            fontSize: 20.0,
                            fontStyle: FontStyle.normal,
                            fontWeight: FontWeight.w700,
                            height: 1.0,
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            );
          }
        },
      ),
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
