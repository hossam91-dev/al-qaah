import 'package:freezed_annotation/freezed_annotation.dart';

part 'hall_entity.freezed.dart';
part 'hall_entity.g.dart';

@freezed
abstract class HallEntity with _$HallEntity {
  const factory HallEntity({
    required String id,
    required String name,
    String? description,
    String? area,
    int? capacity,
    double? pricePerEvent,
    double? avgRating,
    @Default({}) Map<String, dynamic> amenities,
    @Default({}) Map<String, dynamic> location,
    String? region,
    @Default([]) List<String> images,
  }) = _HallEntity;

  factory HallEntity.fromJson(Map<String, dynamic> json) =>
      _$HallEntityFromJson(json);
}
