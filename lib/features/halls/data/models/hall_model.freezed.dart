// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'hall_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$HallModel {

 String get id; String get name; String? get description; String? get area; int? get capacity;@JsonKey(name: 'price_per_event') double? get pricePerEvent;@JsonKey(name: 'avg_rating') double? get avgRating; Map<String, dynamic> get amenities; Map<String, dynamic> get location; String? get region; List<Map<String, dynamic>> get images;
/// Create a copy of HallModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$HallModelCopyWith<HallModel> get copyWith => _$HallModelCopyWithImpl<HallModel>(this as HallModel, _$identity);

  /// Serializes this HallModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is HallModel&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.description, description) || other.description == description)&&(identical(other.area, area) || other.area == area)&&(identical(other.capacity, capacity) || other.capacity == capacity)&&(identical(other.pricePerEvent, pricePerEvent) || other.pricePerEvent == pricePerEvent)&&(identical(other.avgRating, avgRating) || other.avgRating == avgRating)&&const DeepCollectionEquality().equals(other.amenities, amenities)&&const DeepCollectionEquality().equals(other.location, location)&&(identical(other.region, region) || other.region == region)&&const DeepCollectionEquality().equals(other.images, images));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,description,area,capacity,pricePerEvent,avgRating,const DeepCollectionEquality().hash(amenities),const DeepCollectionEquality().hash(location),region,const DeepCollectionEquality().hash(images));

@override
String toString() {
  return 'HallModel(id: $id, name: $name, description: $description, area: $area, capacity: $capacity, pricePerEvent: $pricePerEvent, avgRating: $avgRating, amenities: $amenities, location: $location, region: $region, images: $images)';
}


}

/// @nodoc
abstract mixin class $HallModelCopyWith<$Res>  {
  factory $HallModelCopyWith(HallModel value, $Res Function(HallModel) _then) = _$HallModelCopyWithImpl;
@useResult
$Res call({
 String id, String name, String? description, String? area, int? capacity,@JsonKey(name: 'price_per_event') double? pricePerEvent,@JsonKey(name: 'avg_rating') double? avgRating, Map<String, dynamic> amenities, Map<String, dynamic> location, String? region, List<Map<String, dynamic>> images
});




}
/// @nodoc
class _$HallModelCopyWithImpl<$Res>
    implements $HallModelCopyWith<$Res> {
  _$HallModelCopyWithImpl(this._self, this._then);

  final HallModel _self;
  final $Res Function(HallModel) _then;

/// Create a copy of HallModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? description = freezed,Object? area = freezed,Object? capacity = freezed,Object? pricePerEvent = freezed,Object? avgRating = freezed,Object? amenities = null,Object? location = null,Object? region = freezed,Object? images = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,area: freezed == area ? _self.area : area // ignore: cast_nullable_to_non_nullable
as String?,capacity: freezed == capacity ? _self.capacity : capacity // ignore: cast_nullable_to_non_nullable
as int?,pricePerEvent: freezed == pricePerEvent ? _self.pricePerEvent : pricePerEvent // ignore: cast_nullable_to_non_nullable
as double?,avgRating: freezed == avgRating ? _self.avgRating : avgRating // ignore: cast_nullable_to_non_nullable
as double?,amenities: null == amenities ? _self.amenities : amenities // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>,location: null == location ? _self.location : location // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>,region: freezed == region ? _self.region : region // ignore: cast_nullable_to_non_nullable
as String?,images: null == images ? _self.images : images // ignore: cast_nullable_to_non_nullable
as List<Map<String, dynamic>>,
  ));
}

}


/// Adds pattern-matching-related methods to [HallModel].
extension HallModelPatterns on HallModel {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _HallModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _HallModel() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _HallModel value)  $default,){
final _that = this;
switch (_that) {
case _HallModel():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _HallModel value)?  $default,){
final _that = this;
switch (_that) {
case _HallModel() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String name,  String? description,  String? area,  int? capacity, @JsonKey(name: 'price_per_event')  double? pricePerEvent, @JsonKey(name: 'avg_rating')  double? avgRating,  Map<String, dynamic> amenities,  Map<String, dynamic> location,  String? region,  List<Map<String, dynamic>> images)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _HallModel() when $default != null:
return $default(_that.id,_that.name,_that.description,_that.area,_that.capacity,_that.pricePerEvent,_that.avgRating,_that.amenities,_that.location,_that.region,_that.images);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String name,  String? description,  String? area,  int? capacity, @JsonKey(name: 'price_per_event')  double? pricePerEvent, @JsonKey(name: 'avg_rating')  double? avgRating,  Map<String, dynamic> amenities,  Map<String, dynamic> location,  String? region,  List<Map<String, dynamic>> images)  $default,) {final _that = this;
switch (_that) {
case _HallModel():
return $default(_that.id,_that.name,_that.description,_that.area,_that.capacity,_that.pricePerEvent,_that.avgRating,_that.amenities,_that.location,_that.region,_that.images);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String name,  String? description,  String? area,  int? capacity, @JsonKey(name: 'price_per_event')  double? pricePerEvent, @JsonKey(name: 'avg_rating')  double? avgRating,  Map<String, dynamic> amenities,  Map<String, dynamic> location,  String? region,  List<Map<String, dynamic>> images)?  $default,) {final _that = this;
switch (_that) {
case _HallModel() when $default != null:
return $default(_that.id,_that.name,_that.description,_that.area,_that.capacity,_that.pricePerEvent,_that.avgRating,_that.amenities,_that.location,_that.region,_that.images);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _HallModel extends HallModel {
  const _HallModel({required this.id, required this.name, this.description, this.area, this.capacity, @JsonKey(name: 'price_per_event') this.pricePerEvent, @JsonKey(name: 'avg_rating') this.avgRating, final  Map<String, dynamic> amenities = const {}, final  Map<String, dynamic> location = const {}, this.region, final  List<Map<String, dynamic>> images = const []}): _amenities = amenities,_location = location,_images = images,super._();
  factory _HallModel.fromJson(Map<String, dynamic> json) => _$HallModelFromJson(json);

@override final  String id;
@override final  String name;
@override final  String? description;
@override final  String? area;
@override final  int? capacity;
@override@JsonKey(name: 'price_per_event') final  double? pricePerEvent;
@override@JsonKey(name: 'avg_rating') final  double? avgRating;
 final  Map<String, dynamic> _amenities;
@override@JsonKey() Map<String, dynamic> get amenities {
  if (_amenities is EqualUnmodifiableMapView) return _amenities;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_amenities);
}

 final  Map<String, dynamic> _location;
@override@JsonKey() Map<String, dynamic> get location {
  if (_location is EqualUnmodifiableMapView) return _location;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_location);
}

@override final  String? region;
 final  List<Map<String, dynamic>> _images;
@override@JsonKey() List<Map<String, dynamic>> get images {
  if (_images is EqualUnmodifiableListView) return _images;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_images);
}


/// Create a copy of HallModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$HallModelCopyWith<_HallModel> get copyWith => __$HallModelCopyWithImpl<_HallModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$HallModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _HallModel&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.description, description) || other.description == description)&&(identical(other.area, area) || other.area == area)&&(identical(other.capacity, capacity) || other.capacity == capacity)&&(identical(other.pricePerEvent, pricePerEvent) || other.pricePerEvent == pricePerEvent)&&(identical(other.avgRating, avgRating) || other.avgRating == avgRating)&&const DeepCollectionEquality().equals(other._amenities, _amenities)&&const DeepCollectionEquality().equals(other._location, _location)&&(identical(other.region, region) || other.region == region)&&const DeepCollectionEquality().equals(other._images, _images));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,description,area,capacity,pricePerEvent,avgRating,const DeepCollectionEquality().hash(_amenities),const DeepCollectionEquality().hash(_location),region,const DeepCollectionEquality().hash(_images));

@override
String toString() {
  return 'HallModel(id: $id, name: $name, description: $description, area: $area, capacity: $capacity, pricePerEvent: $pricePerEvent, avgRating: $avgRating, amenities: $amenities, location: $location, region: $region, images: $images)';
}


}

/// @nodoc
abstract mixin class _$HallModelCopyWith<$Res> implements $HallModelCopyWith<$Res> {
  factory _$HallModelCopyWith(_HallModel value, $Res Function(_HallModel) _then) = __$HallModelCopyWithImpl;
@override @useResult
$Res call({
 String id, String name, String? description, String? area, int? capacity,@JsonKey(name: 'price_per_event') double? pricePerEvent,@JsonKey(name: 'avg_rating') double? avgRating, Map<String, dynamic> amenities, Map<String, dynamic> location, String? region, List<Map<String, dynamic>> images
});




}
/// @nodoc
class __$HallModelCopyWithImpl<$Res>
    implements _$HallModelCopyWith<$Res> {
  __$HallModelCopyWithImpl(this._self, this._then);

  final _HallModel _self;
  final $Res Function(_HallModel) _then;

/// Create a copy of HallModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? description = freezed,Object? area = freezed,Object? capacity = freezed,Object? pricePerEvent = freezed,Object? avgRating = freezed,Object? amenities = null,Object? location = null,Object? region = freezed,Object? images = null,}) {
  return _then(_HallModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,area: freezed == area ? _self.area : area // ignore: cast_nullable_to_non_nullable
as String?,capacity: freezed == capacity ? _self.capacity : capacity // ignore: cast_nullable_to_non_nullable
as int?,pricePerEvent: freezed == pricePerEvent ? _self.pricePerEvent : pricePerEvent // ignore: cast_nullable_to_non_nullable
as double?,avgRating: freezed == avgRating ? _self.avgRating : avgRating // ignore: cast_nullable_to_non_nullable
as double?,amenities: null == amenities ? _self._amenities : amenities // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>,location: null == location ? _self._location : location // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>,region: freezed == region ? _self.region : region // ignore: cast_nullable_to_non_nullable
as String?,images: null == images ? _self._images : images // ignore: cast_nullable_to_non_nullable
as List<Map<String, dynamic>>,
  ));
}


}

// dart format on
