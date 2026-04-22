import 'package:injectable/injectable.dart';
import '../../domain/entities/user_entity.dart';
import '../../domain/repositories/auth_repository.dart';
import '../datasources/auth_remote_data_source.dart';

@LazySingleton(as: AuthRepository)
class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource _remoteDataSource;

  AuthRepositoryImpl(this._remoteDataSource);

  @override
  Future<UserEntity> login(String email, String password) {
    return _remoteDataSource.login(email, password);
  }

  @override
  Future<UserEntity> register({
    required String email,
    required String fullName,
    required String password,
  }) {
    return _remoteDataSource.register(
      email: email,
      fullName: fullName,
      password: password,
    );
  }

  @override
  Future<void> sendResetCode(String email) {
    return _remoteDataSource.sendResetCode(email);
  }

  @override
  Future<void> verifyOtp({required String email, required String token}) {
    return _remoteDataSource.verifyOtp(email: email, token: token);
  }

  @override
  Future<void> updatePassword(String newPassword) {
    return _remoteDataSource.updatePassword(newPassword);
  }
}
