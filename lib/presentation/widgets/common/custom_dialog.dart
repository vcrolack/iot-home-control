import 'package:flutter/material.dart';

class CustomDialog extends StatelessWidget {
  final String title;
  final BuildContext context;
  final Widget? content;
  final List items;
  final List<String> actions;
  final String textButton;

  const CustomDialog(
      {super.key,
      required this.title,
      required this.context,
      this.content,
      required this.items,
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
                  itemCount: items.length,
                  itemBuilder: (context, index) {
                    final item = items[index];
                    return ListTile(
                      title: Text(item.name),
                      subtitle: Text('Quantity: ${item.quantity}'),
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
