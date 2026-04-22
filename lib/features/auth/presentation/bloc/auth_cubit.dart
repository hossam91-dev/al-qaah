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

  Future<void> login(String phone, String password) async {
    if (phone.isEmpty || password.isEmpty) return;

    emit(const AuthState.loading());
    try {
      final user = await _authRepository.login(phone, password);
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
    if (fullName.trim().isEmpty || email.trim().isEmpty || password.isEmpty) {
      emit(const AuthState.error('يرجى ملء جميع الحقول المطلوبة'));
      return;
    }

    if (password != confirmPassword) {
      emit(const AuthState.error('كلمتا المرور غير متطابقتين'));
      return;
    }

    if (password.length < 6) {
      emit(const AuthState.error('كلمة المرور يجب أن تكون 6 أحرف على الأقل'));
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
    if (email.trim().isEmpty) {
      emit(const AuthState.error('يرجى إدخال البريد الإلكتروني'));
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
    if (token.trim().length != 6) {
      emit(const AuthState.error('رمز التحقق يجب أن يكون 6 أرقام'));
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
    if (newPassword.length < 6) {
      emit(const AuthState.error('كلمة المرور يجب أن تكون 6 أحرف على الأقل'));
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
