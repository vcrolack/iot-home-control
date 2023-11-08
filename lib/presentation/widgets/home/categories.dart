import 'package:flutter/material.dart';
import 'package:iot_home_control/presentation/mappers/mappers.dart';
import 'package:iot_home_control/presentation/mocks/constants/categories_constant.dart';

class Categories extends StatelessWidget {
  const Categories({super.key});

  @override
  Widget build(BuildContext context) {
    final textStyles = Theme.of(context).textTheme;

    return SizedBox(
      height: 150,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: categories.length,
          itemBuilder: ((context, index) {
            final category =
                CategoryViewModel.fromCategory(categories[index], context);

            return Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: category.color,
              ),
              padding: const EdgeInsets.all(10),
              margin: const EdgeInsets.symmetric(horizontal: 10),
              width: 135,
              child: Column(children: [
                Text(
                  category.name,
                  style: textStyles.bodyLarge,
                ),
                IconButton(
                  onPressed: () {},
                  icon: Icon(category.icon),
                  iconSize: 80,
                )
              ]),
            );
          })),
    );
  }
}
