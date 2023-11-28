import 'package:iot_home_control/domain/entities/entities.dart';

class UserMapper {
  static User fromJson(Map<String, dynamic> json) {
    // Convierte los atributos del usuario en un mapa para un fácil acceso
    var attributes = <String, dynamic>{};
    for (var attr in json['userAttributes']) {
      attributes[attr['Name']] = attr['Value'];
    }

    return User(
      id: attributes['custom:user_id'] ?? '',
      emailVerified: attributes['email_verified'] == 'true',
      customUserId: attributes['sub'] ?? '',
      email: attributes['email'] ?? '',
      username: json['additionalInfo']['NombreUsuario'] ?? '',
      location: json['additionalInfo']['Ubicacion'],
      notificationSettings:
          json['additionalInfo']['ConfiguracionNotificacion'] ?? '',
      cognitoUserId: json['additionalInfo']['CognitoUserId'] ?? '',
      idToken: json['tokens']['idToken'] ?? '',
      accessToken: json['tokens']['accessToken'] ?? '',
    );
  }
}
