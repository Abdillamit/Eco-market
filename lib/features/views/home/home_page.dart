import 'package:eco_market/features/views/home/bloc/category_bloc.dart';
import 'package:eco_market/features/views/home/widgets/buttom_nagigation.dart';
import 'package:eco_market/features/views/home/widgets/card.dart';
import 'package:eco_market/utils/constants/text_strings.dart';
import 'package:eco_market/utils/http/api_categorie_list.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late CategoryBloc _CategoryBloc;

  @override
  void initState() {
    super.initState();
    _CategoryBloc = CategoryBloc(ApiCategoryList());
    _CategoryBloc.add(LoadCategoriesEvent());
  }

  @override
  void dispose() {
    _CategoryBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
      body: const CardCategorys(),
      bottomNavigationBar: const NavigationExample(),
    );
  }
}
