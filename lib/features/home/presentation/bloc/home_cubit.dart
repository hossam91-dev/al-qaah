import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import '../../../../features/halls/domain/entities/hall_entity.dart';
import '../../domain/repositories/home_repository.dart';

part 'home_state.dart';
part 'home_cubit.freezed.dart';

@injectable
class HomeCubit extends Cubit<HomeState> {
  final HomeRepository _homeRepository;

  HomeCubit(this._homeRepository) : super(const HomeState.initial());


  Future<void> getHighestRatedHall() async {
    emit(const HomeState.loading());

    final highestRatedResult = await _homeRepository.getHighestRatedHall();

    highestRatedResult.fold(
      (failure) => emit(HomeState.error(failure.message)),
      (highestRatedHall) =>
          emit(HomeState.loaded(highestRatedHall: highestRatedHall)),
    );
  }
}
