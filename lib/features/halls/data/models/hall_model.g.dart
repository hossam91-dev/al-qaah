// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hall_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_HallModel _$HallModelFromJson(Map<String, dynamic> json) => _HallModel(
  id: json['id'] as String,
  name: json['name'] as String,
  description: json['description'] as String?,
  area: json['area'] as String?,
  capacity: (json['capacity'] as num?)?.toInt(),
  pricePerEvent: (json['price_per_event'] as num?)?.toDouble(),
  avgRating: (json['avg_rating'] as num?)?.toDouble(),
  amenities: json['amenities'] as Map<String, dynamic>? ?? const {},
  location: json['location'] as Map<String, dynamic>? ?? const {},
  region: json['region'] as String?,
  images:
      (json['images'] as List<dynamic>?)
          ?.map((e) => e as Map<String, dynamic>)
          .toList() ??
      const [],
);

Map<String, dynamic> _$HallModelToJson(_HallModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'area': instance.area,
      'capacity': instance.capacity,
      'price_per_event': instance.pricePerEvent,
      'avg_rating': instance.avgRating,
      'amenities': instance.amenities,
      'location': instance.location,
      'region': instance.region,
      'images': instance.images,
    };
