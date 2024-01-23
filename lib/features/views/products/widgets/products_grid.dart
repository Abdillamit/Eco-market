import 'package:eco_market/features/views/products/widgets/card.dart';
import 'package:eco_market/modules/products_list.dart';
import 'package:eco_market/ui/button.dart';
import 'package:eco_market/utils/constants/sizes.dart';
import 'package:eco_market/utils/constants/text_strings.dart';
import 'package:eco_market/utils/helpers/helper.dart';
import 'package:flutter/material.dart';

class ProductsGrid extends StatelessWidget {
  final List<Products> products;
  const ProductsGrid({Key? key, required this.products}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: GridView.builder(
        itemCount: products.length,
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          childAspectRatio: 0.7,
          crossAxisCount: 2,
        ),
        itemBuilder: (context, index) => InkWell(
          onTap: () {
            showModalBottomSheet(
              context: context,
              isDismissible: true,
              builder: (BuildContext context) {
                return DraggableScrollableSheet(
                  expand: false,
                  initialChildSize: 0.9,
                  minChildSize: 0.2,
                  maxChildSize: 1,
                  builder: (BuildContext context,
                      ScrollController scrollController) {
                    return SingleChildScrollView(
                      controller: scrollController,
                      child: Container(
                        margin: const EdgeInsets.all(10),
                        child: Column(
                          children: [
                            Container(
                              width: double.infinity,
                              height: 208.0,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20.0),
                                color: const Color(0xFFF8F8F8),
                                image: DecorationImage(
                                  image: NetworkImage(products[index].image ??
                                      'placeholder_url'),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            const SizedBox(height: 4),
                            Padding(
                              padding: const EdgeInsets.all(4),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    products[index].name ?? 'Unknown Product',
                                    style: const TextStyle(
                                      fontFamily: 'TTNormsPro',
                                      fontSize: 24.0,
                                      fontStyle: FontStyle.normal,
                                      fontWeight: FontWeight.w700,
                                      height: 1.0,
                                    ),
                                  ),
                                  const SizedBox(height: 24),
                                  Row(
                                    children: [
                                      Text(
                                        '${(removeTrailingZeros(products[index].price ?? 'error'))}c',
                                        style: const TextStyle(
                                          color: Color(0xFF75DB1B),
                                          textBaseline:
                                              TextBaseline.ideographic,
                                          fontFamily: 'TTNormsPro',
                                          fontSize: 20.0,
                                          fontStyle: FontStyle.normal,
                                          fontWeight: FontWeight.w700,
                                          height: 1.0,
                                        ),
                                      )
                                    ],
                                  ),
                                  const SizedBox(
                                    height: ASizes.cardRadiusLg,
                                  ),
                                  Text(
                                    products[index].description ??
                                        'Unknown Product',
                                    style: const TextStyle(
                                      color: Color(0xFFACABAD),
                                      fontFamily: 'TTNormsPro',
                                      fontSize: 16.0,
                                      fontStyle: FontStyle.normal,
                                      fontWeight: FontWeight.w400,
                                      height: 1.0,
                                    ),
                                  ),
                                  const SizedBox(height: 24),
                                  SizedBox(
                                    width: 350,
                                    height: 54,
                                    child: CustomButton(
                                      onPressed: () {},
                                      buttonText: ATexts.productCardTitle,
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                );
              },
            );
          },
          child: ProductCart(product: products[index]),
        ),
      ),
    );
  }
}
