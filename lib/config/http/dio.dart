import 'package:dio/dio.dart';
import 'package:iot_home_control/config/constants/environment.dart';

final dio = Dio(BaseOptions(baseUrl: Environment.apiUrlDev));
