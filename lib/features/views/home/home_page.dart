import 'package:cached_network_image/cached_network_image.dart';
import 'package:eco_market/features/views/home/widgets/buttom_nagigation.dart';
import 'package:eco_market/features/views/home/bloc/category_bloc.dart';
import 'package:eco_market/features/views/products/bloc/products_bloc.dart';
import 'package:eco_market/features/views/products/products_page.dart';
import 'package:eco_market/ui/button.dart';
import 'package:eco_market/ui/shimmer_widgets.dart';
import 'package:eco_market/utils/constants/image_strings.dart';
import 'package:eco_market/utils/constants/text_strings.dart';
import 'package:eco_market/utils/http/api_categorie_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
      body: BlocBuilder<CategoryBloc, CategoryState>(
        builder: (context, state) {
          if (state is LoadingState) {
            return const ShimmerGridView();
          } else if (state is ErrorState) {
            return Center(
                child: Container(
              width: 343.0,
              height: 458.0,
              padding:
                  const EdgeInsets.symmetric(vertical: 24.0, horizontal: 0.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.0),
                color: Colors.white,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(AImages.networkError),
                  const SizedBox(height: 16),
                  const Text(
                    'Отсутствует интернет  соединение',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Color(0xFF1F1F1F),
                      fontFamily: 'TT Norms Pro',
                      fontSize: 24.0,
                      fontStyle: FontStyle.normal,
                      fontWeight: FontWeight.w700,
                      height: 1.0,
                    ),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    'Попробуйте подключить мобильный интернет',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Color(0xFFACABAD),
                      fontFamily: 'TT Norms Pro',
                      fontSize: 18.0,
                      fontStyle: FontStyle.normal,
                      fontWeight: FontWeight.w400,
                      height: 1.0,
                    ),
                  ),
                  const SizedBox(height: 24),
                  SizedBox(
                    width: 311,
                    height: 54,
                    child: CustomButton(
                      onPressed: () {},
                      buttonText: ATexts.appBarTitle,
                    ),
                  ),
                ],
              ),
            ));
          } else if (state is LoadedState) {
            return GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 16.0,
                mainAxisSpacing: 16.0,
              ),
              padding: const EdgeInsets.all(16),
              itemCount: state.categories.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    context.read<ProductsBloc>().add(
                          FilterProductsByCategory(
                            categoryName: '${state.categories[index].name}',
                          ),
                        );
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const ProductsPage(),
                      ),
                    );
                  },
                  child: Stack(
                    alignment: Alignment.bottomLeft,
                    children: [
                      Positioned.fill(
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: ColorFiltered(
                            colorFilter: ColorFilter.mode(
                              Colors.black.withOpacity(0.3),
                              BlendMode.srcOver,
                            ),
                            child: CachedNetworkImage(
                              imageUrl: state.categories[index].image != null
                                  ? state.categories[index].image!
                                  : 'error img categories',
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10),
                        child: Text(
                          '${state.categories[index].name}',
                          style: const TextStyle(
                            color: Colors.white,
                            fontFamily: 'TTNormsPro',
                            fontSize: 20.0,
                            fontStyle: FontStyle.normal,
                            fontWeight: FontWeight.w700,
                            height: 1.0,
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            );
          }
          return Container();
        },
      ),
      bottomNavigationBar: const NavigationExample(),
    );
  }
}
