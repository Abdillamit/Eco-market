import 'package:eco_market/features/views/cart/bloc/cart_bloc.dart';
import 'package:eco_market/features/views/home/bloc/category_bloc.dart';
import 'package:eco_market/features/views/home/home_page.dart';
import 'package:eco_market/features/views/products/bloc/products_bloc.dart';
import 'package:eco_market/utils/http/api_categorie_list.dart';
import 'package:eco_market/utils/http/api_products_list.dart';
import 'package:eco_market/utils/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<CategoryBloc>(
          create: (BuildContext context) =>
              CategoryBloc(ApiCategoryList())..add(LoadCategoriesEvent()),
        ),
        BlocProvider<ProductsBloc>(
          create: (context) => ProductsBloc(ApiProductsList()),
        ),
        BlocProvider(create: (context) => CartBloc())
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        themeMode: ThemeMode.light,
        theme: AAppTheme.lightTheme,
        darkTheme: AAppTheme.lightTheme,
        home: const Home(),
      ),
    );
  }
}
