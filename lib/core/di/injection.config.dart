// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i361;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:supabase_flutter/supabase_flutter.dart' as _i454;

import '../../features/auth/data/datasources/auth_remote_data_source.dart'
    as _i107;
import '../../features/auth/data/datasources/supabase_auth_remote_data_source.dart'
    as _i34;
import '../../features/auth/data/repositories/auth_repository_impl.dart'
    as _i153;
import '../../features/auth/domain/repositories/auth_repository.dart' as _i787;
import '../../features/auth/presentation/bloc/auth_cubit.dart' as _i52;
import '../../features/halls/data/datasources/halls_remote_data_source.dart'
    as _i239;
import '../../features/halls/data/repositories/halls_repository_impl.dart'
    as _i318;
import '../../features/halls/domain/repositories/halls_repository.dart'
    as _i906;
import '../../features/halls/presentation/bloc/halls_cubit.dart' as _i981;
import '../../features/home/data/datasources/home_remote_data_source.dart'
    as _i362;
import '../../features/home/data/repositories/home_repository_impl.dart'
    as _i76;
import '../../features/home/domain/repositories/home_repository.dart' as _i0;
import '../../features/home/presentation/bloc/home_cubit.dart' as _i816;
import '../network/network_module.dart' as _i200;
import 'injection.dart' as _i464;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    final appModule = _$AppModule();
    final networkModule = _$NetworkModule();
    gh.lazySingleton<_i454.SupabaseClient>(() => appModule.supabaseClient);
    gh.lazySingleton<_i361.Dio>(() => networkModule.dio);
    gh.lazySingleton<_i107.AuthRemoteDataSource>(
      () => _i34.SupabaseAuthRemoteDataSource(gh<_i454.SupabaseClient>()),
    );
    gh.lazySingleton<_i787.AuthRepository>(
      () => _i153.AuthRepositoryImpl(gh<_i107.AuthRemoteDataSource>()),
    );
    gh.lazySingleton<_i239.HallsRemoteDataSource>(
      () => _i239.HallsRemoteDataSourceImpl(gh<_i454.SupabaseClient>()),
    );
    gh.lazySingleton<_i362.HomeRemoteDataSource>(
      () => _i362.HomeRemoteDataSourceImpl(gh<_i454.SupabaseClient>()),
    );
    gh.factory<_i52.AuthCubit>(
      () => _i52.AuthCubit(gh<_i787.AuthRepository>()),
    );
    gh.lazySingleton<_i0.HomeRepository>(
      () => _i76.HomeRepositoryImpl(gh<_i362.HomeRemoteDataSource>()),
    );
    gh.lazySingleton<_i906.HallsRepository>(
      () => _i318.HallsRepositoryImpl(gh<_i239.HallsRemoteDataSource>()),
    );
    gh.factory<_i816.HomeCubit>(
      () => _i816.HomeCubit(gh<_i0.HomeRepository>()),
    );
    gh.factory<_i981.HallsCubit>(
      () => _i981.HallsCubit(gh<_i906.HallsRepository>()),
    );
    return this;
  }
}

class _$AppModule extends _i464.AppModule {}

class _$NetworkModule extends _i200.NetworkModule {}
