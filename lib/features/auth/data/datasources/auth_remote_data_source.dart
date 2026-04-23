import '../../domain/entities/user_entity.dart';

abstract class AuthRemoteDataSource {
  Future<UserEntity> login(String email, String password);
  Future<UserEntity> register({
    required String email,
    required String fullName,
    required String password,
  });
  Future<void> sendResetCode(String email);
  Future<void> verifyOtp({required String email, required String token});
  Future<void> updatePassword(String newPassword);
  Future<UserEntity?> getCurrentUser();
  Future<void> logout();
}
