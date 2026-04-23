import 'package:fpdart/fpdart.dart';
import '../../../../core/error/failures.dart';
import '../entities/user_entity.dart';

abstract class AuthRepository {
  Future<Either<Failure, UserEntity>> login(String email, String password);
  Future<Either<Failure, UserEntity>> register({
    required String email,
    required String fullName,
    required String password,
  });
  Future<Either<Failure, void>> sendResetCode(String email);
  Future<Either<Failure, void>> verifyOtp({
    required String email,
    required String token,
  });
  Future<Either<Failure, void>> updatePassword(String newPassword);
  Future<Either<Failure, UserEntity?>> getCurrentUser();
  Future<Either<Failure, void>> logout();
}
