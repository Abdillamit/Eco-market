import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerImg extends StatelessWidget {
  final Color baseColor;
  final Color highlightColor;

  const ShimmerImg({
    Key? key,
    required this.baseColor,
    required this.highlightColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: baseColor,
      highlightColor: highlightColor,
      child: Container(
        margin: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: const Color.fromARGB(255, 248, 248, 248),
        ),
      ),
    );
  }
}

class ShimmerGrid extends StatelessWidget {
  const ShimmerGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[100]!,
      child: SingleChildScrollView(
        child: GridView.builder(
          itemCount: 6,
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            childAspectRatio: 0.7,
            crossAxisCount: 2,
          ),
          itemBuilder: (context, index) {
            return ShimmerImg(
              baseColor: Colors.grey[300]!,
              highlightColor: Colors.grey[100]!,
            );
          },
        ),
      ),
    );
  }
}

class ShimmerCategories extends StatelessWidget {
  const ShimmerCategories({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[100]!,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: List.generate(
            6,
            (index) => Container(
              margin: const EdgeInsets.all(8),
              padding: const EdgeInsets.symmetric(
                vertical: 10,
                horizontal: 18,
              ),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(18),
                boxShadow: const [
                  BoxShadow(
                    blurRadius: 1.0,
                    color: Colors.grey,
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class ShimmerGridView extends StatelessWidget {
  const ShimmerGridView({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[100]!,
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 16.0,
          mainAxisSpacing: 16.0,
        ),
        padding: const EdgeInsets.all(16),
        itemCount: 6,
        itemBuilder: (context, index) {
          return Container(
            decoration: BoxDecoration(
              color: Colors.grey[300],
              borderRadius: BorderRadius.circular(10),
            ),
          );
        },
      ),
    );
  }
}
