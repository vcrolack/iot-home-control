import 'package:dio/dio.dart';
import 'package:iot_home_control/config/http/dio.dart';
import 'package:iot_home_control/domain/datasources/auth/auth_datasource.dart';
import 'package:iot_home_control/domain/entities/user.dart';
import 'package:iot_home_control/infraestructure/errors/errors.dart';
import 'package:iot_home_control/infraestructure/mappers/user_mapper.dart';

class AwsAuthDatasource extends AuthDatasource {
  @override
  Future<bool> checkAuthStatus(String accessToken) async {
    try {
      final response = await dio.get('/auth/check-status',
          options: Options(headers: {'Authorization': 'Bearer $accessToken'}));
      return response.data['isValid'];
    } on DioException catch (e) {
      if (e.response?.statusCode == 400) throw InvalidToken('Invalid token');

      if (e.type == DioExceptionType.connectionTimeout) {
        throw ConnectionTimeout();
      }

      throw CustomError(statusCode: 500, message: 'Unxpected error');
    } catch (error) {
      throw CustomError(statusCode: 500, message: 'Unxpected error');
    }
  }

  @override
  Future<User> login(String email, String password) async {
    try {
      final response = await dio.post('/auth/login',
          data: {'CorreoElectronico': email, 'Contrasena': password});

      final user = UserMapper.fromJson(response.data);
      return user;
    } on DioException catch (e) {
      if (e.response?.statusCode == 401) throw WrongCredentials();

      if (e.type == DioExceptionType.connectionTimeout) {
        throw ConnectionTimeout();
      }

      throw CustomError(statusCode: 500, message: 'Unxpected error');
    } catch (error) {
      throw CustomError(statusCode: 500, message: 'Unxpected error');
    }
  }

  @override
  Future<User> register(String username, String email, String password) {
    // todo: implement register
    throw UnimplementedError();
  }
}
