import 'package:flutter/material.dart';
import 'package:eco_market/utils/constants/text_strings.dart';

class NavigationExample extends StatefulWidget {
  final int currentIndex;
  final Function(int) onSelectTab;

  const NavigationExample({
    Key? key,
    required this.currentIndex,
    required this.onSelectTab,
  }) : super(key: key);

  @override
  State<NavigationExample> createState() => _NavigationExampleState();
}

class _NavigationExampleState extends State<NavigationExample> {
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      onTap: widget.onSelectTab,
      selectedItemColor: const Color(0xFF75DB1B),
      currentIndex: widget.currentIndex,
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
}
