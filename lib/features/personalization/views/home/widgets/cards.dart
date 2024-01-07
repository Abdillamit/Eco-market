/*External dependencies */
import 'dart:ui';

import 'package:eco_market/features/personalization/views/products/products.dart';
import 'package:eco_market/utils/constants/text_strings.dart';
import 'package:eco_market/utils/http/api_categorie_list.dart';
import 'package:flutter/material.dart';
/*Local dependencies */

class Category {
  int? id;
  String? image;
  String? name;
  Category({
    this.id,
    this.image,
    this.name,
  });

  static fromJson(item) {}
}

class CardsPage extends StatefulWidget {
  const CardsPage({super.key});

  @override
  State<CardsPage> createState() => _ProductCategoriesState();
}

class _ProductCategoriesState extends State<CardsPage> {
  int _currentindex = 0;
  Future<List<Category>> fetchData() async {
    return getCategories();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _getBody(),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: const Color(0xFF75DB1B),
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home_filled),
            label: 'Главная',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.badge),
            label: 'Корзина',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.lock_clock),
            label: 'История',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.question_mark_rounded),
            label: 'Инфо',
          ),
        ],
        currentIndex: _currentindex,
        selectedItemColor: const Color(0xFF75DB1B),
        unselectedItemColor: Theme.of(context).shadowColor,
        unselectedFontSize: 14,
        showUnselectedLabels: true,
        onTap: (index) {
          setState(() => _currentindex = index);
        },
      ),
    );
  }

  Widget _getBody() {
    switch (_currentindex) {
      case 0:
        return Scaffold(
          appBar: AppBar(
              centerTitle: true,
              title: const Text(
                ATexts.appBarTitle,
                style: TextStyle(
                  color: Color(0xFF1F1F1F),
                  fontFamily: 'TTNormsPro',
                  fontSize: 24.0,
                  fontStyle: FontStyle.normal,
                  fontWeight: FontWeight.w700,
                  height: 1.0,
                  fontFeatures: [
                    FontFeature.disable('clig'),
                    FontFeature.disable('liga'),
                  ],
                ),
              )),
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
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const Products(),
                            settings: RouteSettings(
                              arguments: {
                                'categoryName': '${snapshot.data![index].name}',
                              },
                            ),
                          ),
                        );
                      },
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
                                fontFeatures: [
                                  FontFeature.disable('clig'),
                                  FontFeature.disable('liga'),
                                ],
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
      case 1:
      default:
        return Container();
    }
  }
}
