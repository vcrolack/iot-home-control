import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:iot_home_control/config/constants/constants.dart';
import 'package:iot_home_control/domain/entities/entities.dart';
import 'package:iot_home_control/domain/repositories/repositories.dart';
import 'package:iot_home_control/infraestructure/datasources/auth/aws_auth_datasource.dart';
import 'package:iot_home_control/infraestructure/errors/errors.dart';
import 'package:iot_home_control/infraestructure/repositories/auth/auth_repository_impl.dart';
import 'package:iot_home_control/presentation/providers/storage/local_storage_provider.dart';

final authProvider = StateNotifierProvider<AuthNotifier, AuthState>((ref) {
  final AuthRepository authRepository = AuthRepositoryImpl(AwsAuthDatasource());
  return AuthNotifier(authRepository: authRepository, ref: ref);
});

class AuthNotifier extends StateNotifier<AuthState> {
  final AuthRepository authRepository;
  late final LocalStorageRepository localStorageRepository;

  AuthNotifier({required this.authRepository, required Ref ref})
      : super(AuthState()) {
    localStorageRepository = ref.read(localStorageRepositoryProvider);
  }

  Future<void> loginUser(String email, String password) async {
    try {
      final user = await authRepository.login(email, password);
      await localStorageRepository.saveLoginUser(user);
      _setLoggedUser(user);
    } on WrongCredentials {
      logout('Wrong credentials');
    } on ConnectionTimeout {
      logout('Timeout. Check your connection');
    } catch (e) {
      logout('Unexpected error');
    }
  }

  void registerUser(String email, String password, String username) {}

  void checkAuthStatus() {}

  Future<void> logout([String? errorMessage]) async {
    await localStorageRepository.removeLoginUser();
    state = state.copyWith(
        authStatus: AuthStatus.notAuthenticated,
        user: null,
        errorMessage: errorMessage);
  }

  void _setLoggedUser(User user) {
    // todo: save token on isar db
    state = state.copyWith(
        authStatus: AuthStatus.authenticated, user: user, errorMessage: '');
  }
}

class AuthState {
  final AuthStatus authStatus;
  final User? user;
  final String errorMessage;

  AuthState(
      {this.authStatus = AuthStatus.checking,
      this.user,
      this.errorMessage = ''});

  AuthState copyWith(
          {AuthStatus? authStatus, User? user, String? errorMessage}) =>
      AuthState(
          authStatus: authStatus ?? this.authStatus,
          user: user ?? this.user,
          errorMessage: errorMessage ?? this.errorMessage);
}
