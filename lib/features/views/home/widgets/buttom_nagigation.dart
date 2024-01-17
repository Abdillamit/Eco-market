import 'package:eco_market/features/views/home/home_page.dart';
import 'package:eco_market/features/views/products/products_page.dart';
import 'package:eco_market/utils/constants/text_strings.dart';
import 'package:flutter/material.dart';

class NavigationExample extends StatefulWidget {
  const NavigationExample({Key? key}) : super(key: key);

  @override
  State<NavigationExample> createState() => _NavigationExampleState();
}

class _NavigationExampleState extends State<NavigationExample> {
  int currentPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      onTap: (int index) {
        setState(() {
          currentPageIndex = index;
        });
      },
      selectedItemColor: const Color(0xFF75DB1B),
      currentIndex: currentPageIndex,
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
      unselectedItemColor: const Color(0xFFD2D1D5),
      showUnselectedLabels: true,
    );
  }

  Widget _buildPageContent(BuildContext context) {
    switch (currentPageIndex) {
      case 0:
        return const Home();
      case 1:
        return const ProductsPage();
      case 2:
        return const Center(child: Text('Page not implemented'));
      default:
        return const Center(child: Text('Page not implemented'));
    }
  }
}
