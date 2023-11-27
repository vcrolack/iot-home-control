import 'package:flutter/material.dart';
import 'package:iot_home_control/presentation/mocks/constants/products_constant.dart';

class CustomDialog extends StatelessWidget {
  final String title;
  final BuildContext context;
  final Widget? content;
  final List? items;
  final List<String> actions;
  final String textButton;

  const CustomDialog(
      {super.key,
      required this.title,
      required this.context,
      this.content,
      this.items,
      required this.actions,
      required this.textButton});

  Future<void> _dialogBuilder(BuildContext context) {
    return showDialog<void>(
        context: context,
        builder: (BuildContext dialogContext) {
          return AlertDialog(
            title: Text(title),
            content: SizedBox(
              width: double.maxFinite,
              child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: products.length,
                  itemBuilder: (context, index) {
                    final product = products[index];
                    return ListTile(
                      title: Text(product.name),
                      subtitle: Text('Quantity: ${product.quantity}'),
                      leading: const Icon(Icons.shopping_cart),
                    );
                  }),
            ),
            actions: actions
                .map((action) => TextButton(
                      onPressed: () {
                        Navigator.of(dialogContext).pop();
                      },
                      child: Text(action),
                    ))
                .toList(),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return FilledButton(
        onPressed: () => _dialogBuilder(context), child: Text(textButton));
  }
}
