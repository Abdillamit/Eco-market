// import 'package:bloc/bloc.dart';
// import 'package:eco_market/modules/category_list.dart';
// import 'package:http/http.dart' as http;

// part 'home_event.dart';
// // part 'home_state.dart';

// class HomeBloc extends Bloc<HomeEvent, HomeState> {
//   HomeBloc() : super(HomeInitial());

//   @override
//   Stream<HomeState> mapEventToState(HomeEvent event) async* {
//     if (event is FetchCategories) {
//       yield HomeLoadingState();

//       try {
//         final List<Category> categories = await _getCategories();
//         yield HomeLoadedState(categories);
//       } catch (e) {
//         yield HomeErrorState('Error: $e');
//       }
//     }
//   }

//   Future<List<Category>> _getCategories() async {
//     final response = await http
//         .get(Uri.parse('https://neobook.online/ecobak/product-category-list/'));

//     if (response.statusCode == 200) {
//       final List<dynamic> data = json.decode(utf8.decode(response.bodyBytes));

//       return data
//           .map((item) => Category.fromJson(item))
//           .where((category) => category.image != null && category.name != null)
//           .toList();
//     } else {
//       throw Exception('Failed to load data');
//     }
//   }
// }

