import 'package:flutter/material.dart';
import 'package:iot_home_control/presentation/mocks/constants/products_constant.dart';
import 'package:iot_home_control/presentation/widgets/widgets.dart';

class AnalysisDataScreen extends StatelessWidget {
  static const name = 'analysis-data-screen';

  const AnalysisDataScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Analysis'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 20),
        child: Column(children: [
          const ProductsCounter(
            quantity: 5,
          ),
          Flexible(child: ListProducts(label: 'Pantry', products: products)),
        ]),
      ),
    );
  }
}
