import 'package:flutter/material.dart';
import 'package:eco_market/utils/constants/text_strings.dart';
import 'package:iconsax/iconsax.dart';

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
      items: <BottomNavigationBarItem>[
        const BottomNavigationBarItem(
          icon: Icon(Iconsax.home),
          label: ATexts.bottomTitle1,
        ),
       BottomNavigationBarItem(
  icon: Stack(
    children: [
      const Icon(Iconsax.shopping_cart),
      Positioned(
        top: 0,
        right: 0,
        left: 10,
        child: Container(
          width: 16,
          height: 16,
          padding: const EdgeInsets.all(10),
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.red, 
          ),
          child: const Text(  '1',
          textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
              fontSize: 10,
              fontWeight: FontWeight.bold,
            ),),
        ),
      ),
    ],
  ),
  label: ATexts.bottomTitle2,
),

        const BottomNavigationBarItem(
          icon: Icon(Iconsax.story5),
          label: ATexts.bottomTitle3,
        ),
        const BottomNavigationBarItem(
          icon: Icon(Iconsax.information),
          label: ATexts.bottomTitle4,
        ),
      ],
      unselectedItemColor: const Color(0xFFD2D1D5),
      showUnselectedLabels: true,
    );
  }
}
