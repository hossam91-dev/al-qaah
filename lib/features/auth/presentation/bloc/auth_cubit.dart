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
}
