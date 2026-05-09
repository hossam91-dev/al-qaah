import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/error/error_handler.dart';
import '../../../../core/error/failures.dart';
import '../../domain/entities/hall_entity.dart';
import '../../domain/repositories/halls_repository.dart';
import '../datasources/halls_remote_data_source.dart';

@LazySingleton(as: HallsRepository)
class HallsRepositoryImpl implements HallsRepository {
  final HallsRemoteDataSource _remoteDataSource;

  HallsRepositoryImpl(this._remoteDataSource);

  @override
  Future<Either<Failure, List<HallEntity>>> getAllHalls({String? region, String? searchQuery}) async {
    try {
      final models = await _remoteDataSource.getAllHalls(region: region, searchQuery: searchQuery);
      return right(models.map((m) => m.toEntity()).toList());
    } catch (e, stackTrace) {
      return left(ErrorHandler.handle(e, stackTrace));
    }
  }

  @override
  Future<Either<Failure, HallEntity>> getHallById(String id) async {
    try {
      final model = await _remoteDataSource.getHallById(id);
      return right(model.toEntity());
    } catch (e, stackTrace) {
      return left(ErrorHandler.handle(e, stackTrace));
    }
  }
}
