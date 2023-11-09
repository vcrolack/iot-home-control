import 'package:flutter/material.dart';

class ProductsCounter extends StatelessWidget {
  final int quantity;

  const ProductsCounter({super.key, required this.quantity});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return SizedBox(
      width: double.infinity,
      child: Card(
        elevation: 0.2,
        color: colors.primary.withOpacity(0.4),
        child: Padding(
            padding: const EdgeInsets.all(25),
            child: Column(
              children: [
                const Text(
                  'Products',
                  style: TextStyle(
                    fontSize: 50,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                Text(
                  '$quantity',
                  style: const TextStyle(fontSize: 50),
                )
              ],
            )),
      ),
    );
  }
}
