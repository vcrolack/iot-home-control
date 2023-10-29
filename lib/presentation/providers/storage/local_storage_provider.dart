import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:iot_home_control/infraestructure/datasources/isar_local_storage_datasource.dart';
import 'package:iot_home_control/infraestructure/repositories/local_storage_repository_impl.dart';

final localStorageRepositoryProvider =
    Provider((ref) => LocalStorageRepositoryImpl(IsarLocalStorageDatasource()));
