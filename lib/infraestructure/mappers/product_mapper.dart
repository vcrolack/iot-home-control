import 'package:intl/intl.dart';
import 'package:iot_home_control/domain/entities/product.dart';

class ProductMapper {
  static fromJson(Map<String, dynamic> json) {
    DateTime purchaseDateTime = _parseDate(json['FechaCompra']);
    DateTime expiryDateTime = _parseDate(json['FechaCaducidad']);

    return Product(
      id: json['ID'],
      name: json['NombreItem'],
      purchaseDate: purchaseDateTime,
      expiryDate: expiryDateTime,
      quantity: double.parse(json['CantidadDisponible'].toString()),
      sizes: json['UnidadesMedida'],
      userId: json['PropietarioID'],
    );
  }

  static DateTime _parseDate(String dateString) {
    // Convierte una cadena en formato 'dd-MM-yyyy' a un objeto DateTime
    return DateFormat('dd-MM-yyyy').parse(dateString);
  }
}
