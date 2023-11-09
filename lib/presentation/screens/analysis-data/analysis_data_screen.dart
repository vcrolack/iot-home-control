import 'package:flutter/material.dart';
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
      body: const SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 50, horizontal: 20),
          child: Center(
            child: Column(children: [
              ProductsCounter(
                quantity: 5,
              )
            ]),
          ),
        ),
      ),
    );
  }
}
