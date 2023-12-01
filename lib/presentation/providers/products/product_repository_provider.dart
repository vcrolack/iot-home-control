import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:iot_home_control/domain/repositories/repositories.dart';
import 'package:iot_home_control/infraestructure/datasources/datasources.dart';
import 'package:iot_home_control/infraestructure/repositories/repositories.dart';
import 'package:iot_home_control/presentation/providers/auth/auth_provider.dart';

final productsRepositoryProvider = Provider<ProductsRepository>((ref) {
  final idToken = ref.watch(authProvider).user?.idToken ?? '';

  final productsRepository =
      ProductsRepositoryImpl(AwsProductsDatasource(idToken: idToken));

  return productsRepository;
});
