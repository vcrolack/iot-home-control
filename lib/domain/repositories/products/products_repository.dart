import 'package:iot_home_control/domain/entities/entities.dart';

abstract class ProductsRepository {
  Future<List<Product>> getProductsByUser(int id);
  Future<Product> getProductByUser(int productId, int userId);
}
