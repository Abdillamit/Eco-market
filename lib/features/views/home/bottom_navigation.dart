// import 'package:flutter/material.dart';

// class BottomNavigation extends StatelessWidget {
//   BottomNavigation({Key? key}) : super(key: key);
//   int _currentIndex = 0;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: _getBody(),
//       bottomNavigationBar: BottomNavigationBar(
//         items: const <BottomNavigationBarItem>[
//           BottomNavigationBarItem(
//             icon: Icon(Icons.home_filled),
//             label: 'Главная',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.badge),
//             label: 'Корзина',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.lock_clock),
//             label: 'История',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.question_mark_rounded),
//             label: 'Инфо',
//           ),
//         ],
//         currentIndex: _currentIndex,
//         selectedItemColor: Theme.of(context).primaryColor,
//         unselectedItemColor: Theme.of(context).shadowColor,
//         unselectedFontSize: 14,
//         showUnselectedLabels: true,
//       ),
//     );
//   }

//   Widget _getBody() {
//     switch (_currentIndex) {
//       case 0:
//         return Container();
//       case 1:
//         // return const CartScreen();
//         return Container(); // Замените на ваш виджет для Корзины
//       case 2:
//         // return const OrderHistoryScreen();
//         return Container(); // Замените на ваш виджет для Истории
//       case 3:
//         // return const InfoScreen();
//         return Container(); // Замените на ваш виджет для Инфо
//       default:
//         return Container();
//     }
//   }
// }