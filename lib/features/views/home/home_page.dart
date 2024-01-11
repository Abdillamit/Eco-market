import 'package:eco_market/features/views/home/bloc/home_bloc.dart';
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
  int _currentIndex = 0;
  late HomeBloc _HomeBloc;

  @override
  void initState() {
    super.initState();
    _HomeBloc = HomeBloc(ApiCategoryList());
    _HomeBloc.add(LoadCategoriesEvent());
  }

  @override
  void dispose() {
    _HomeBloc.close();
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
      body: BlocProvider(
        create: (context) => _HomeBloc,
        child: _buildBody(),
      ),
      bottomNavigationBar: BottomNavigationBar(
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
        currentIndex: _currentIndex,
        selectedItemColor: const Color(0xFF75DB1B),
        unselectedItemColor: const Color(0xFFD2D1D5),
        unselectedFontSize: 14,
        showUnselectedLabels: true,
        onTap: _onItemTapped,
      ),
    );
  }

  Widget _buildBody() {
    return BlocBuilder<HomeBloc, CardsState>(
      builder: (context, state) {
        if (state is LoadingState) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is ErrorState) {
          return Center(child: Text('Error: ${state.error}'));
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
                onTap: () {},
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
                          child: Image.network(
                            '${state.categories[index].image}',
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
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }
}
