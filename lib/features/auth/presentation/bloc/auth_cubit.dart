import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import '../../domain/entities/user_entity.dart';
import '../../domain/repositories/auth_repository.dart';

part 'auth_state.dart';
part 'auth_cubit.freezed.dart';

@injectable
class AuthCubit extends Cubit<AuthState> {
  final AuthRepository _authRepository;

  AuthCubit(this._authRepository) : super(const AuthState.initial());

  Future<void> checkAuth() async {
    final result = await _authRepository.getCurrentUser();
    result.fold((failure) => emit(const AuthState.initial()), (user) {
      if (user != null) {
        emit(AuthState.success(user));
      } else {
        emit(const AuthState.initial());
      }
    });
  }

  Future<void> logout() async {
    final result = await _authRepository.logout();
    result.fold(
      (failure) => emit(AuthState.error(failure.message)),
      (_) => emit(const AuthState.initial()),
    );
  }

  Future<void> login(String email, String password) async {
    emit(const AuthState.loading());
    final result = await _authRepository.login(email, password);
    result.fold(
      (failure) => emit(AuthState.error(failure.message)),
      (user) => emit(AuthState.success(user)),
    );
  }

  Future<void> register({
    required String fullName,
    required String email,
    required String password,
  }) async {
    emit(const AuthState.loading());
    final result = await _authRepository.register(
      email: email.trim(),
      fullName: fullName.trim(),
      password: password,
    );
    result.fold(
      (failure) => emit(AuthState.error(failure.message)),
      (user) => emit(AuthState.success(user)),
    );
  }

  Future<void> sendResetCode(String email) async {
    emit(const AuthState.loading());
    final result = await _authRepository.sendResetCode(email.trim());
    result.fold(
      (failure) => emit(AuthState.error(failure.message)),
      (_) => emit(const AuthState.codeSent()),
    );
  }

  Future<void> verifyOtp({required String email, required String token}) async {
    emit(const AuthState.loading());
    final result = await _authRepository.verifyOtp(
      email: email.trim(),
      token: token.trim(),
    );
    result.fold(
      (failure) => emit(AuthState.error(failure.message)),
      (_) => emit(const AuthState.otpVerified()),
    );
  }

  Future<void> updatePassword(String newPassword) async {
    emit(const AuthState.loading());
    final result = await _authRepository.updatePassword(newPassword);
    result.fold(
      (failure) => emit(AuthState.error(failure.message)),
      (_) => emit(const AuthState.passwordResetSuccess()),
    );
  }
}
