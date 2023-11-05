import 'package:iot_home_control/domain/entities/entities.dart';

class Light extends Device {
  double brightness;

  Light(
      {required super.id,
      required super.name,
      required super.type,
      required super.categoryId,
      required super.description,
      required super.state,
      required super.userId,
      required this.brightness});
}
