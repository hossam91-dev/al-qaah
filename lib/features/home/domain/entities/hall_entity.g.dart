// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hall_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_HallEntity _$HallEntityFromJson(Map<String, dynamic> json) => _HallEntity(
  id: json['id'] as String,
  name: json['name'] as String,
  description: json['description'] as String?,
  area: json['area'] as String?,
  capacity: (json['capacity'] as num?)?.toInt(),
  pricePerEvent: (json['pricePerEvent'] as num?)?.toDouble(),
  avgRating: (json['avgRating'] as num?)?.toDouble(),
  amenities: json['amenities'] as Map<String, dynamic>? ?? const {},
  location: json['location'] as Map<String, dynamic>? ?? const {},
  region: json['region'] as String?,
  images:
      (json['images'] as List<dynamic>?)?.map((e) => e as String).toList() ??
      const [],
);

Map<String, dynamic> _$HallEntityToJson(_HallEntity instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'area': instance.area,
      'capacity': instance.capacity,
      'pricePerEvent': instance.pricePerEvent,
      'avgRating': instance.avgRating,
      'amenities': instance.amenities,
      'location': instance.location,
      'region': instance.region,
      'images': instance.images,
    };
