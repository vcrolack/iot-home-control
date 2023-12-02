import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:iot_home_control/presentation/providers/providers.dart';
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
      body: const _AnalysisView(),
    );
  }
}

class _AnalysisView extends ConsumerStatefulWidget {
  const _AnalysisView();

  @override
  _AnalysisViewState createState() => _AnalysisViewState();
}

class _AnalysisViewState extends ConsumerState {
  @override
  void initState() {
    super.initState();

    Future.microtask(() => ref.read(productsProvider.notifier).loadpage());
  }

  @override
  void dispose() {
    super.dispose();
  }

  Future<void> onRefresh() async {
    await ref.read(productsProvider.notifier).loadpage();
  }

  @override
  Widget build(BuildContext context) {
    final productState = ref.watch(productsProvider);

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 20),
      child: Column(children: [
        ProductsCounter(
          quantity: productState.products.length,
        ),
        Flexible(
            child: RefreshIndicator(
                onRefresh: () => onRefresh(),
                child: ListProducts(
                    label: 'Pantry', products: productState.products))),
      ]),
    );
  }
}
