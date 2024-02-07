import 'package:eco_market/features/views/cart/basket.dart';
import 'package:eco_market/features/views/info/info_page.dart';
import 'package:eco_market/features/views/story/story.dart';
import 'package:flutter/material.dart';
import 'package:eco_market/features/views/home/bloc/category_bloc.dart';
import 'package:eco_market/features/views/home/widgets/buttom_nagigation.dart';
import 'package:eco_market/features/views/home/widgets/card.dart';
import 'package:eco_market/utils/constants/text_strings.dart';
import 'package:eco_market/utils/http/api_categorie_list.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late CategoryBloc _categoryBloc;
  late PageController _pageController;
  int currentPageIndex = 0;

  @override
  void initState() {
    super.initState();
    _categoryBloc = CategoryBloc(ApiCategoryList());
    _categoryBloc.add(LoadCategoriesEvent());

    _pageController = PageController(initialPage: currentPageIndex);
  }

  @override
  void dispose() {
    _categoryBloc.close();
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        onPageChanged: (index) {
          setState(() {
            currentPageIndex = index;
          });
        },
        children: [
          Scaffold(
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
            body: const CardCategorys(),
          ),
          const Basket(),
          const Story(),
          const Info(),
        ],
      ),
      bottomNavigationBar: NavigationExample(
        currentIndex: currentPageIndex,
        onSelectTab: (index) {
          _pageController.animateToPage(
            index,
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeInOut,
          );
        },
      ),
    );
  }
}
