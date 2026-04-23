import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/utils/validation_utils.dart';
import '../../domain/entities/user_entity.dart';
import '../../domain/repositories/auth_repository.dart';

part 'auth_state.dart';
part 'auth_cubit.freezed.dart';

@injectable
class AuthCubit extends Cubit<AuthState> {
  final AuthRepository _authRepository;

  AuthCubit(this._authRepository) : super(const AuthState.initial());

  Future<void> checkAuth() async {
    try {
      final user = await _authRepository.getCurrentUser();
      if (user != null) {
        emit(AuthState.success(user));
      } else {
        emit(const AuthState.initial());
      }
    } catch (_) {
      emit(const AuthState.initial());
    }
  }

  Future<void> logout() async {
    await _authRepository.logout();
    emit(const AuthState.initial());
  }

  Future<void> login(String email, String password) async {
    final emailError = ValidationUtils.validateEmail(email);
    final passwordError = ValidationUtils.validatePassword(password);

    if (emailError != null) {
      emit(AuthState.error(emailError));
      return;
    }
    if (passwordError != null) {
      emit(AuthState.error(passwordError));
      return;
    }

    emit(const AuthState.loading());
    try {
      final user = await _authRepository.login(email, password);
      emit(AuthState.success(user));
    } catch (e) {
      emit(AuthState.error(e.toString()));
    }
  }

  Future<void> register({
    required String fullName,
    required String email,
    required String password,
    required String confirmPassword,
  }) async {
    final fullNameError = ValidationUtils.validateFullName(fullName);
    final emailError = ValidationUtils.validateEmail(email);
    final passwordError = ValidationUtils.validatePassword(password);
    final confirmPasswordError = ValidationUtils.validateConfirmPassword(password, confirmPassword);

    if (fullNameError != null) {
      emit(AuthState.error(fullNameError));
      return;
    }
    if (emailError != null) {
      emit(AuthState.error(emailError));
      return;
    }
    if (passwordError != null) {
      emit(AuthState.error(passwordError));
      return;
    }
    if (confirmPasswordError != null) {
      emit(AuthState.error(confirmPasswordError));
      return;
    }

    emit(const AuthState.loading());
    try {
      final user = await _authRepository.register(
        email: email.trim(),
        fullName: fullName.trim(),
        password: password,
      );
      emit(AuthState.success(user));
    } catch (e) {
      emit(AuthState.error(e.toString()));
    }
  }

  Future<void> sendResetCode(String email) async {
    final emailError = ValidationUtils.validateEmail(email);
    if (emailError != null) {
      emit(AuthState.error(emailError));
      return;
    }

    emit(const AuthState.loading());
    try {
      await _authRepository.sendResetCode(email.trim());
      emit(const AuthState.codeSent());
    } catch (e) {
      emit(AuthState.error(e.toString()));
    }
  }

  Future<void> verifyOtp({required String email, required String token}) async {
    final otpError = ValidationUtils.validateOtp(token);
    if (otpError != null) {
      emit(AuthState.error(otpError));
      return;
    }

    emit(const AuthState.loading());
    try {
      await _authRepository.verifyOtp(email: email.trim(), token: token.trim());
      emit(const AuthState.otpVerified());
    } catch (e) {
      emit(AuthState.error(e.toString()));
    }
  }

  Future<void> updatePassword(String newPassword) async {
    final passwordError = ValidationUtils.validatePassword(newPassword);
    if (passwordError != null) {
      emit(AuthState.error(passwordError));
      return;
    }

    emit(const AuthState.loading());
    try {
      await _authRepository.updatePassword(newPassword);
      emit(const AuthState.passwordResetSuccess());
    } catch (e) {
      emit(AuthState.error(e.toString()));
    }
  }
}
