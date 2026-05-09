import 'package:freezed_annotation/freezed_annotation.dart';
import '../../domain/entities/hall_entity.dart';

part 'halls_state.freezed.dart';

@freezed
class HallsState with _$HallsState {
  const factory HallsState.initial() = _Initial;
  const factory HallsState.loading() = _Loading;
  const factory HallsState.loaded({
    @Default([]) List<HallEntity> halls,
    HallEntity? selectedHall,
  }) = _Loaded;
  const factory HallsState.error(String message) = _Error;
}
