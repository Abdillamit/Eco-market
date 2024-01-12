import 'package:eco_market/features/views/home/bloc/home_bloc.dart';
import 'package:eco_market/features/views/home/home_page.dart';
import 'package:eco_market/features/views/products/bloc/products_bloc.dart';
import 'package:eco_market/utils/http/api_categorie_list.dart';
import 'package:eco_market/utils/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class App extends StatelessWidget {
  const App({Key? key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<HomeBloc>(
          create: (BuildContext context) => HomeBloc(ApiCategoryList()),
        ),
        BlocProvider<ProductsBloc>(
          create: (BuildContext context) => ProductsBloc(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        themeMode: ThemeMode.system,
        theme: AAppTheme.lightTheme,
        darkTheme: AAppTheme.darkTheme,
        home: const Home(),
      ),
    );
  }
}
