import 'package:iot_home_control/domain/datasources/datasources.dart';
import 'package:iot_home_control/domain/entities/product.dart';
import 'package:iot_home_control/domain/repositories/repositories.dart';

class ProductsRepositoryImpl extends ProductsRepository {
  final ProductsDatasource datasource;

  ProductsRepositoryImpl(this.datasource);

  @override
  Future<Product> getProductByUser(int productId, int userId) {
    return datasource.getProductByUser(productId, userId);
  }

  @override
  Future<List<Product>> getProductsByUser(int id) {
    return datasource.getProductsByUser(id);
  }
}
