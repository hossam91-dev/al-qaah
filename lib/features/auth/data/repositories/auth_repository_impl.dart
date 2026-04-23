import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/error/error_handler.dart';
import '../../../../core/error/failures.dart';
import '../../domain/entities/user_entity.dart';
import '../../domain/repositories/auth_repository.dart';
import '../datasources/auth_remote_data_source.dart';

@LazySingleton(as: AuthRepository)
class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource _remoteDataSource;

  AuthRepositoryImpl(this._remoteDataSource);

  @override
  Future<Either<Failure, UserEntity>> login(
    String email,
    String password,
  ) async {
    try {
      final user = await _remoteDataSource.login(email, password);
      return Right(user);
    } catch (e, s) {
      return Left(ErrorHandler.handle(e, s));
    }
  }

  @override
  Future<Either<Failure, UserEntity>> register({
    required String email,
    required String fullName,
    required String password,
  }) async {
    try {
      final user = await _remoteDataSource.register(
        email: email,
        fullName: fullName,
        password: password,
      );
      return Right(user);
    } catch (e, s) {
      return Left(ErrorHandler.handle(e, s));
    }
  }

  @override
  Future<Either<Failure, void>> sendResetCode(String email) async {
    try {
      await _remoteDataSource.sendResetCode(email);
      return const Right(null);
    } catch (e, s) {
      return Left(ErrorHandler.handle(e, s));
    }
  }

  @override
  Future<Either<Failure, void>> verifyOtp({
    required String email,
    required String token,
  }) async {
    try {
      await _remoteDataSource.verifyOtp(email: email, token: token);
      return const Right(null);
    } catch (e, s) {
      return Left(ErrorHandler.handle(e, s));
    }
  }

  @override
  Future<Either<Failure, void>> updatePassword(String newPassword) async {
    try {
      await _remoteDataSource.updatePassword(newPassword);
      return const Right(null);
    } catch (e, s) {
      return Left(ErrorHandler.handle(e, s));
    }
  }

  @override
  Future<Either<Failure, UserEntity?>> getCurrentUser() async {
    try {
      final user = await _remoteDataSource.getCurrentUser();
      return Right(user);
    } catch (e, s) {
      return Left(ErrorHandler.handle(e, s));
    }
  }

  @override
  Future<Either<Failure, void>> logout() async {
    try {
      await _remoteDataSource.logout();
      return const Right(null);
    } catch (e, s) {
      return Left(ErrorHandler.handle(e, s));
    }
  }
}
