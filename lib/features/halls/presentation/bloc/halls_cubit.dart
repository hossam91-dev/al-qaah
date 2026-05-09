import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import '../../domain/repositories/halls_repository.dart';
import 'halls_state.dart';

@injectable
class HallsCubit extends Cubit<HallsState> {
  final HallsRepository _hallsRepository;

  HallsCubit(this._hallsRepository) : super(const HallsState.initial());

  Future<void> getAllHalls({String? region, String? searchQuery}) async {
    emit(const HallsState.loading());
    final result = await _hallsRepository.getAllHalls(region: region, searchQuery: searchQuery);
    result.fold(
      (failure) => emit(HallsState.error(failure.message)),
      (halls) => emit(HallsState.loaded(halls: halls)),
    );
  }

  Future<void> getHallById(String id) async {
    emit(const HallsState.loading());
    final result = await _hallsRepository.getHallById(id);
    result.fold(
      (failure) => emit(HallsState.error(failure.message)),
      (hall) => emit(HallsState.loaded(selectedHall: hall)),
    );
  }
}
