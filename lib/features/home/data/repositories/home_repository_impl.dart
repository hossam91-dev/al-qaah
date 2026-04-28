import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/error/error_handler.dart';
import '../../../../core/error/failures.dart';
import '../../domain/entities/hall_entity.dart';
import '../../domain/repositories/home_repository.dart';
import '../datasources/home_remote_data_source.dart';

@LazySingleton(as: HomeRepository)
class HomeRepositoryImpl implements HomeRepository {
  final HomeRemoteDataSource _remoteDataSource;

  HomeRepositoryImpl(this._remoteDataSource);

  @override
  Future<Either<Failure, List<HallEntity>>> getHalls({
    String? region,
    String? category,
  }) async {
    try {
      final models = await _remoteDataSource.getHalls(
        region: region,
        category: category,
      );
      return right(models.map((m) => m.toEntity()).toList());
    } catch (e, stackTrace) {
      return left(ErrorHandler.handle(e, stackTrace));
    }
  }

  @override
  Future<Either<Failure, List<HallEntity>>> getFeaturedHalls() async {
    try {
      final models = await _remoteDataSource.getFeaturedHalls();
      return right(models.map((m) => m.toEntity()).toList());
    } catch (e, stackTrace) {
      return left(ErrorHandler.handle(e, stackTrace));
    }
  }

  @override
  Future<Either<Failure, HallEntity?>> getHighestRatedHall() async {
    try {
      final model = await _remoteDataSource.getHighestRatedHall();
      return right(model?.toEntity());
    } catch (e, stackTrace) {
      return left(ErrorHandler.handle(e, stackTrace));
    }
  }
}
