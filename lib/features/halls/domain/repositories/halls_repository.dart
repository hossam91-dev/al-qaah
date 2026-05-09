import 'package:fpdart/fpdart.dart';
import '../../../../core/error/failures.dart';
import '../entities/hall_entity.dart';

abstract class HallsRepository {
  Future<Either<Failure, List<HallEntity>>> getAllHalls({String? region, String? searchQuery});
  Future<Either<Failure, HallEntity>> getHallById(String id);
}
