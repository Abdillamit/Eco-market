import 'package:eco_market/features/personalization/views/home/widgets/cards.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: CardsPage(),
      // bottomNavigationBar: BottomNavigation(),
    );
  }
}
