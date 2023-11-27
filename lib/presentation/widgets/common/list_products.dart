import 'package:flutter/material.dart';
import 'package:iot_home_control/domain/entities/entities.dart';
import 'package:iot_home_control/presentation/widgets/widgets.dart';

class ListProducts extends StatelessWidget {
  final String label;
  final List<Product> products;
  final int? itemCount;
  // todo: implements the consume by product (maybe JOIN between Despensa table with Registro consumo table

  const ListProducts(
      {super.key,
      required this.label,
      required this.products,
      this.itemCount = 5});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Text(
                label,
                style: const TextStyle(
                  fontSize: 50,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Spacer(),
              CustomDialog(
                  title: 'Daily use',
                  context: context,
                  actions: const ['Close'],
                  textButton: 'See all')
              // FilledButton(onPressed: () {}, child: const Text('See all'))
            ],
          ),
        ),
        Expanded(
          child: ListView.builder(
            itemCount: itemCount,
            itemBuilder: (BuildContext context, int index) {
              if (index < products.length) {
                Product product = products[index];
                return ListTile(
                  title: Text(product.name),
                  subtitle: Text('Quantity: ${product.quantity}'),
                  leading: const Icon(Icons.shopping_cart),
                );
              } else {
                return const SizedBox.shrink();
              }
            },
          ),
        ),
      ],
    );
  }
}
