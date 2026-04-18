import 'package:injectable/injectable.dart';
import '../../domain/entities/user_entity.dart';

abstract class AuthRemoteDataSource {
  Future<UserEntity> login(String phone, String password);
}

@LazySingleton(as: AuthRemoteDataSource)
class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  AuthRemoteDataSourceImpl();

  @override
  Future<UserEntity> login(String phone, String password) async {
    // For now, this is a mock implementation.
    // In Phase 3, we'll configure the real ApiClient.
    await Future.delayed(const Duration(seconds: 2));
    
    if (phone == "0123456789" && password == "password") {
      return const UserEntity(
        id: "1",
        phone: "0123456789",
        name: "Test User",
        token: "fake_token",
      );
    } else {
      throw Exception("Invalid credentials");
    }
  }
}
