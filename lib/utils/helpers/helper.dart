import 'package:eco_market/modules/products_list.dart';

String removeTrailingZeros(String price) {
  double parsedPrice = double.tryParse(price) ?? 0;
  String formattedPrice = parsedPrice.toString();

  if (formattedPrice.contains('.')) {
    formattedPrice = formattedPrice.replaceAll(RegExp(r'0*$'), '');
    formattedPrice = formattedPrice.replaceAll(RegExp(r'.$'), '');
  }
  return formattedPrice;
}

String calculateTotalSum(List<Products> cartItems) {
  double totalSum = 0.0;
  for (var item in cartItems) {
    totalSum += item.totalSum ?? 0;
  }
  return '${removeTrailingZeros(totalSum.toString())}c';
}

String calculateTotalAmount(List<Products> cartItems) {
  double totalSum = 0.0;
  for (var item in cartItems) {
    totalSum += item.totalSum ?? 0;
  }
  totalSum += 150;
  return '${removeTrailingZeros(totalSum.toString())} c';
}
