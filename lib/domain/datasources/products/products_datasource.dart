import 'package:iot_home_control/domain/entities/entities.dart';

abstract class ProductsDatasource {
  Future<List<Product>> getProductsByUser(int id);
  Future<Product> getProductByUser(int productId, int userId);
}
