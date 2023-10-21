import 'package:flutter/material.dart';

class Search extends StatelessWidget {
  const Search({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 70),
      child: TextField(
        decoration: InputDecoration(
            prefixIcon: const Icon(Icons.search_outlined),
            hintText: 'Search...',
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(50))),
      ),
    );
  }
}
