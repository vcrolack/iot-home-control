import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:iot_home_control/domain/entities/entities.dart';
import 'package:iot_home_control/domain/repositories/repositories.dart';
import 'package:iot_home_control/presentation/providers/providers.dart';

final productsProvider =
    StateNotifierProvider<ProductsNotifier, ProductsState>((ref) {
  final productsRepository = ref.watch(productsRepositoryProvider);
  final localStorageRepository = ref.watch(localStorageRepositoryProvider);

  return ProductsNotifier(
      productsRepository: productsRepository,
      localStorageRepository: localStorageRepository);
});

class ProductsNotifier extends StateNotifier<ProductsState> {
  final ProductsRepository productsRepository;
  final LocalStorageRepository localStorageRepository;

  ProductsNotifier(
      {required this.productsRepository, required this.localStorageRepository})
      : super(ProductsState()) {
    loadpage();
  }

  //load next page
  Future loadpage() async {
    if (state.isLoading) return;

    state = state.copyWith(isLoading: true, products: []);

    final user = await localStorageRepository.getLoginUser();
    final id = user?.id;

    final products =
        await productsRepository.getProductsByUser(int.parse(id.toString()));

    // if (products.isNotEmpty) {
    //   state = state.copyWith(isLoading: false);
    //   return;
    // }

    state = state
        .copyWith(isLoading: false, products: [...state.products, ...products]);
  }
}

class ProductsState {
  // todo: implements pagination
  // final bool isLastPage;
  // final int limit;
  // final int offset;
  final bool isLoading;
  final List<Product> products;

  ProductsState({this.isLoading = false, this.products = const []});

  ProductsState copyWith({
    bool? isLoading,
    List<Product>? products,
  }) =>
      ProductsState(
          isLoading: isLoading ?? this.isLoading,
          products: products ?? this.products);
}
