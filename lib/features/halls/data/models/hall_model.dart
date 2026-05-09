import 'package:freezed_annotation/freezed_annotation.dart';
import '../../domain/entities/hall_entity.dart';

part 'hall_model.freezed.dart';
part 'hall_model.g.dart';

@freezed
abstract class HallModel with _$HallModel {
  const factory HallModel({
    required String id,
    required String name,
    String? description,
    String? area,
    int? capacity,
    @JsonKey(name: 'price_per_event') double? pricePerEvent,
    @JsonKey(name: 'avg_rating') double? avgRating,
    @Default({}) Map<String, dynamic> amenities,
    @Default({}) Map<String, dynamic> location,
    String? region,
    @Default([]) List<Map<String, dynamic>> images,
  }) = _HallModel;

  factory HallModel.fromJson(Map<String, dynamic> json) =>
      _$HallModelFromJson(json);

  factory HallModel.fromEntity(HallEntity entity) {
    return HallModel(
      id: entity.id,
      name: entity.name,
      description: entity.description,
      area: entity.area,
      capacity: entity.capacity,
      pricePerEvent: entity.pricePerEvent,
      avgRating: entity.avgRating,
      amenities: entity.amenities,
      location: entity.location,
      region: entity.region,
    );
  }

  const HallModel._();

  HallEntity toEntity() {
    return HallEntity(
      id: id,
      name: name,
      description: description,
      area: area,
      capacity: capacity,
      pricePerEvent: pricePerEvent,
      avgRating: avgRating,
      amenities: amenities,
      location: location,
      region: region,
      images: images
          .map((img) => img['url'] as String?)
          .whereType<String>()
          .toList(),
    );
  }
}
