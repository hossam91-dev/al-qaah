import 'package:injectable/injectable.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../domain/entities/user_entity.dart';
import 'auth_remote_data_source.dart';

@LazySingleton(as: AuthRemoteDataSource)
class SupabaseAuthRemoteDataSource implements AuthRemoteDataSource {
  final SupabaseClient _supabase;

  SupabaseAuthRemoteDataSource(this._supabase);

  @override
  Future<UserEntity> login(String email, String password) async {
    final response = await _supabase.auth.signInWithPassword(
      email: email,
      password: password,
    );

    final authUser = response.user;
    if (authUser == null) {
      throw Exception('Login failed: no user returned.');
    }

    final userRow = await _supabase
        .from('users')
        .select()
        .eq('id', authUser.id)
        .single();

    return UserEntity(
      id: userRow['id'] as String,
      email: userRow['email'] as String,
      name: userRow['full_name'] as String?,
    );
  }

  @override
  Future<UserEntity> register({
    required String email,
    required String fullName,
    required String password,
  }) async {
    // 1. Create auth user in Supabase Auth
    final response = await _supabase.auth.signUp(
      email: email,
      password: password,
      data: {'full_name': fullName, 'email': email},
    );

    final authUser = response.user;
    if (authUser == null) {
      throw Exception('Registration failed: no user returned.');
    }

    // 2. Save the user profile in the public users table.
    // The on_auth_user_created trigger handles this automatically,
    // but we upsert here to guarantee the row exists before returning.
    await _supabase.from('users').upsert({
      'id': authUser.id,
      'email': email,
      'full_name': fullName,
      'role': 'customer',
    });

    return UserEntity(id: authUser.id, email: email, name: fullName);
  }

  @override
  Future<void> sendResetCode(String email) async {
    await _supabase.auth.resetPasswordForEmail(email);
  }

  @override
  Future<void> verifyOtp({required String email, required String token}) async {
    await _supabase.auth.verifyOTP(
      email: email,
      token: token,
      type: OtpType.recovery,
    );
  }

  @override
  Future<void> updatePassword(String newPassword) async {
    await _supabase.auth.updateUser(UserAttributes(password: newPassword));
  }
}
