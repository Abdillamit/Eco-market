/*External dependencies */
import 'dart:ui';

import 'package:eco_market/bloc/card_bloc.dart';
import 'package:eco_market/features/personalization/views/products/products.dart';
import 'package:eco_market/modules/category_list.dart';
import 'package:eco_market/utils/constants/text_strings.dart';
import 'package:eco_market/utils/http/api_categorie_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
/*Local dependencies */

class CardsPage extends StatefulWidget {
  const CardsPage({super.key});

  @override
  State<CardsPage> createState() => _ProductCategoriesState();
}

class _ProductCategoriesState extends State<CardsPage> {
  int _currentindex = 0;
  late CardsBloc _cardsBloc;

  @override
  void initState() {
    super.initState();
    _cardsBloc = CardsBloc(ApiCategoryList());
    _cardsBloc.add(LoadCategoriesEvent());
  }

  @override
  void dispose() {
    _cardsBloc.close();
    super.dispose();
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
            label: ATexts.bottomTitle1,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.badge),
            label: ATexts.bottomTitle2,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.lock_clock),
            label: ATexts.bottomTitle3,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.question_mark_rounded),
            label: ATexts.bottomTitle4,
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
            ),
          ),
          body: BlocBuilder<CardsBloc, CardsState>(
            builder: (context, state) {
              if (state is LoadingState) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else if (state is ErrorState) {
                return Center(
                  child: Text('Error: ${state.error}'),
                );
              } else if (state is LoadedState) {
                print('Categories: ${state.categories}');
                return GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 16.0,
                    mainAxisSpacing: 16.0,
                  ),
                  padding: const EdgeInsets.all(16),
                  itemCount: state.categories.length,
                  itemBuilder: (context, index) {
                    print('Building category item at index $index');
                    Category category = state.categories[index];
                    print('Category name: ${category.name}');
                    print('Category image URL: ${category.image}');
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const Products(),
                            settings: RouteSettings(
                              arguments: {
                                'categoryName': '${category.name}',
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
                                  '${category.image}',
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(10),
                            child: Text(
                              '${category.name}',
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
              } else {
                return const Center(
                  child: Text('Unexpected state'),
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
