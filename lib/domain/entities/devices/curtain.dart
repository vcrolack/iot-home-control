import 'package:iot_home_control/domain/entities/entities.dart';

class Curtain extends Device {
  bool isOpen;

  Curtain(
      {required super.id,
      required super.name,
      required super.type,
      required super.categoryId,
      required super.description,
      required super.state,
      required super.userId,
      required this.isOpen});
}
