import 'package:eco_market/ui/input.dart';
import 'package:eco_market/utils/constants/text_strings.dart';
import 'package:flutter/material.dart';

class Products extends StatelessWidget {
  const Products({super.key});

  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable
    List catList = [
      'Все',
      'Фрукты',
      'Сухофрукты',
      'Овощи',
      'Зелень',
      'Чай кофе',
      'Молочные продукты',
    ];
    var cardsName = [
      'Яблоко золотая радуга',
      'Апельсины',
      'Драконий фрукт',
    ];
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          ATexts.appBarTitleProduct,
          style: TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(top: 20, left: 16),
            child: Column(
              children: [
                const Padding(
                  padding: EdgeInsets.only(
                    right: 25,
                  ),
                  child: Input(
                    prefixIcon: Icons.search,
                    labelText: 'Быстрый поиск',
                  ),
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 25),
                    child: Row(
                      children: [
                        for (int i = 0; i < catList.length; i++)
                          Container(
                            margin: const EdgeInsets.all(8),
                            padding: const EdgeInsets.symmetric(
                                vertical: 10, horizontal: 18),
                            decoration: BoxDecoration(
                              color: catList[i] == 'Фрукты'
                                  ? const Color(0xFF75DB1B)
                                  : Colors.white,
                              borderRadius: BorderRadius.circular(18),
                              boxShadow: const [
                                BoxShadow(
                                  color: Colors.grey,
                                )
                              ],
                            ),
                            child: Text(catList[i]),
                          ),
                      ],
                    ),
                  ),
                ),
                GridView.builder(
                  itemCount: cardsName.length,
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    childAspectRatio: 0.7,
                    crossAxisCount: 2,
                  ),
                  itemBuilder: (context, index) => InkWell(
                    onTap: () {},
                    child: Container(
                      margin: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: const Color(0xFFF8F8F8),
                        boxShadow: const [
                          BoxShadow(
                              color: Color(0xFFF8F8F8),
                              blurRadius: 5,
                              spreadRadius: 2)
                        ],
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: Column(
                          children: [
                            Padding(
                                padding: const EdgeInsets.all(10),
                                child: Image.asset(
                                  "assets/images/image1.png",
                                  height: 100,
                                  width: 100,
                                )),
                            const SizedBox(
                              height: 15,
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(cardsName[index]),
                                  const SizedBox(height: 10),
                                  const Row(
                                    children: [
                                      Text(
                                        "\$100",
                                        style: TextStyle(
                                            fontSize: 15,
                                            color: Color(0xFF75DB1B)),
                                      )
                                    ],
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
