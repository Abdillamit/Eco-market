import 'package:eco_market/bloc/card_bloc.dart';
import 'package:eco_market/features/personalization/views/home/widgets/cards.dart';
import 'package:eco_market/utils/http/api_categorie_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<CardsBloc>(
          create: (BuildContext context) => CardsBloc(ApiCategoryList()),
        ),
      ],
      child: const Scaffold(
        body: CardsPage(),
      ),
    );
  }
}
