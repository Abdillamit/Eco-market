import 'package:eco_market/modules/products_list.dart';
import 'package:flutter/material.dart';

class ProductsGrid extends StatelessWidget {
  final List<Products> products;

  String removeTrailingZeros(String price) {
    double parsedPrice = double.tryParse(price) ?? 0;
    String formattedPrice = parsedPrice.toString();

    if (formattedPrice.contains('.')) {
      formattedPrice = formattedPrice.replaceAll(RegExp(r'0*$'), '');
      formattedPrice = formattedPrice.replaceAll(RegExp(r'.$'), '');
    }
    return formattedPrice;
  }

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
              builder: (BuildContext context) {
                return DraggableScrollableSheet(
                  expand: false,
                  initialChildSize: .9,
                  minChildSize: .9,
                  maxChildSize: .9,
                  builder: (BuildContext context,
                      ScrollController scrollController) {
                    return SingleChildScrollView(
                      child: Container(
                        margin: const EdgeInsets.all(10),
                        child: Column(
                          children: [
                            Container(
                              width: 343.0,
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
                                        '${(double.tryParse(products[index].price ?? '0.0') ?? 0.0).toStringAsFixed(2)}c',
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
                                  const SizedBox(height: 16),
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
                                    child: TextButton(
                                      onPressed: () {},
                                      style: ButtonStyle(
                                        backgroundColor:
                                            MaterialStateProperty.all<Color>(
                                                const Color(0xFF75DB1B)),
                                        padding: MaterialStateProperty.all<
                                            EdgeInsetsGeometry>(
                                          const EdgeInsets.all(10.0),
                                        ),
                                        shape: MaterialStateProperty.all<
                                            OutlinedBorder>(
                                          RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(12.0),
                                          ),
                                        ),
                                      ),
                                      child: const Text(
                                        'Добавить',
                                        style: TextStyle(
                                          color: Color(0xFFFFFFFF),
                                          fontFamily: 'TTNormsPro',
                                          fontSize: 16.0,
                                          fontStyle: FontStyle.normal,
                                          fontWeight: FontWeight.w500,
                                          height: 1.0,
                                        ),
                                      ),
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
          child: _buildProductContainer(products[index]),
        ),
      ),
    );
  }

  Widget _buildProductContainer(Products product) {
    return Container(
      padding: const EdgeInsets.all(4),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.0),
          color: const Color(0xFFF8F8F8),
        ),
        child: Container(
          padding: const EdgeInsets.all(3),
          child: Column(
            children: [
              Container(
                width: 166.0,
                height: 100.0,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.0),
                  color: const Color(0xFFF8F8F8),
                  image: DecorationImage(
                    image: NetworkImage(product.image ?? 'placeholder_url'),
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
                      product.name ?? 'Unknown Product',
                      style: const TextStyle(
                        fontFamily: 'TTNormsPro',
                        fontSize: 14.0,
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.w500,
                        height: 1.0,
                      ),
                    ),
                    const SizedBox(height: 24),
                    Row(
                      children: [
                        Text(
                          '${(removeTrailingZeros(product.price ?? 'error'))}c',
                          style: const TextStyle(
                            color: Color(0xFF75DB1B),
                            textBaseline: TextBaseline.ideographic,
                            fontFamily: 'TTNormsPro',
                            fontSize: 20.0,
                            fontStyle: FontStyle.normal,
                            fontWeight: FontWeight.w700,
                            height: 1.0,
                          ),
                        )
                      ],
                    ),
                    const SizedBox(height: 5),
                    SizedBox(
                      width: 158,
                      child: TextButton(
                        onPressed: () {},
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(
                              const Color(0xFF75DB1B)),
                          padding:
                              MaterialStateProperty.all<EdgeInsetsGeometry>(
                            const EdgeInsets.all(10.0),
                          ),
                          shape: MaterialStateProperty.all<OutlinedBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12.0),
                            ),
                          ),
                        ),
                        child: const Text(
                          'Добавить',
                          style: TextStyle(
                            color: Color(0xFFFFFFFF),
                            fontFamily: 'TTNormsPro',
                            fontSize: 16.0,
                            fontStyle: FontStyle.normal,
                            fontWeight: FontWeight.w500,
                            height: 1.0,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
