import 'package:iot_home_control/domain/entities/entities.dart';

class Pantry extends Device {
  int quantity;

  Pantry(
      {required super.id,
      required super.name,
      required super.type,
      required super.categoryId,
      required super.description,
      required super.state,
      required super.userId,
      required this.quantity});
}
