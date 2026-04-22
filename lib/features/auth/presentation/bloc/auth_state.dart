part of 'auth_cubit.dart';

@freezed
class AuthState with _$AuthState {
  const factory AuthState.initial() = _Initial;
  const factory AuthState.loading() = _Loading;
  const factory AuthState.success(UserEntity user) = _Success;
  const factory AuthState.codeSent() = _CodeSent;
  const factory AuthState.otpVerified() = _OtpVerified;
  const factory AuthState.passwordResetSuccess() = _PasswordResetSuccess;
  const factory AuthState.error(String message) = _Error;
}
