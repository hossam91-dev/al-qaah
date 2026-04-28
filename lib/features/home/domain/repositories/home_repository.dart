import 'package:fpdart/fpdart.dart';
import '../../../../core/error/failures.dart';
import '../entities/hall_entity.dart';

abstract class HomeRepository {
  Future<Either<Failure, List<HallEntity>>> getHalls({
    String? region,
    String? category,
  });

  Future<Either<Failure, List<HallEntity>>> getFeaturedHalls();
  Future<Either<Failure, HallEntity?>> getHighestRatedHall();
}
