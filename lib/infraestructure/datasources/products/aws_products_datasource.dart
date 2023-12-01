import 'package:dio/dio.dart';
import 'package:iot_home_control/config/constants/environment.dart';
import 'package:iot_home_control/domain/datasources/datasources.dart';
import 'package:iot_home_control/domain/entities/product.dart';
import 'package:iot_home_control/infraestructure/mappers/mappers.dart';

class AwsProductsDatasource extends ProductsDatasource {
  late final Dio dio;
  final String idToken;

  AwsProductsDatasource({required this.idToken})
      : dio = Dio(BaseOptions(
            baseUrl: Environment.apiUrlDev,
            headers: {'Authorization': 'Bearer $idToken'}));

  @override
  Future<Product> getProductByUser(int productId, int userId) {
    // todo: implement getProductByUser
    throw UnimplementedError();
  }

  @override
  Future<List<Product>> getProductsByUser(int id) async {
    final response = await dio.get<List>('/pantries/user/$id');
    final List<Product> products = [];
    for (final product in response.data ?? []) {
      products.add(ProductMapper.fromJson(product));
    }

    return products;
  }
}
