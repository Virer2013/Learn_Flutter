// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'location.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Location _$LocationFromJson(Map<String, dynamic> json) {
  return _Location.fromJson(json);
}

/// @nodoc
class _$LocationTearOff {
  const _$LocationTearOff();

  _Location call({String city = 'Helena', String? zipcode}) {
    return _Location(
      city: city,
      zipcode: zipcode,
    );
  }

  Location fromJson(Map<String, Object?> json) {
    return Location.fromJson(json);
  }
}

/// @nodoc
const $Location = _$LocationTearOff();

/// @nodoc
mixin _$Location {
  String get city => throw _privateConstructorUsedError;
  String? get zipcode => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $LocationCopyWith<Location> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LocationCopyWith<$Res> {
  factory $LocationCopyWith(Location value, $Res Function(Location) then) =
      _$LocationCopyWithImpl<$Res>;
  $Res call({String city, String? zipcode});
}

/// @nodoc
class _$LocationCopyWithImpl<$Res> implements $LocationCopyWith<$Res> {
  _$LocationCopyWithImpl(this._value, this._then);

  final Location _value;
  // ignore: unused_field
  final $Res Function(Location) _then;

  @override
  $Res call({
    Object? city = freezed,
    Object? zipcode = freezed,
  }) {
    return _then(_value.copyWith(
      city: city == freezed
          ? _value.city
          : city // ignore: cast_nullable_to_non_nullable
              as String,
      zipcode: zipcode == freezed
          ? _value.zipcode
          : zipcode // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
abstract class _$LocationCopyWith<$Res> implements $LocationCopyWith<$Res> {
  factory _$LocationCopyWith(_Location value, $Res Function(_Location) then) =
      __$LocationCopyWithImpl<$Res>;
  @override
  $Res call({String city, String? zipcode});
}

/// @nodoc
class __$LocationCopyWithImpl<$Res> extends _$LocationCopyWithImpl<$Res>
    implements _$LocationCopyWith<$Res> {
  __$LocationCopyWithImpl(_Location _value, $Res Function(_Location) _then)
      : super(_value, (v) => _then(v as _Location));

  @override
  _Location get _value => super._value as _Location;

  @override
  $Res call({
    Object? city = freezed,
    Object? zipcode = freezed,
  }) {
    return _then(_Location(
      city: city == freezed
          ? _value.city
          : city // ignore: cast_nullable_to_non_nullable
              as String,
      zipcode: zipcode == freezed
          ? _value.zipcode
          : zipcode // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Location implements _Location {
  const _$_Location({this.city = 'Helena', this.zipcode});

  factory _$_Location.fromJson(Map<String, dynamic> json) =>
      _$$_LocationFromJson(json);

  @JsonKey(defaultValue: 'Helena')
  @override
  final String city;
  @override
  final String? zipcode;

  @override
  String toString() {
    return 'Location(city: $city, zipcode: $zipcode)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Location &&
            (identical(other.city, city) || other.city == city) &&
            (identical(other.zipcode, zipcode) || other.zipcode == zipcode));
  }

  @override
  int get hashCode => Object.hash(runtimeType, city, zipcode);

  @JsonKey(ignore: true)
  @override
  _$LocationCopyWith<_Location> get copyWith =>
      __$LocationCopyWithImpl<_Location>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_LocationToJson(this);
  }
}

abstract class _Location implements Location {
  const factory _Location({String city, String? zipcode}) = _$_Location;

  factory _Location.fromJson(Map<String, dynamic> json) = _$_Location.fromJson;

  @override
  String get city;
  @override
  String? get zipcode;
  @override
  @JsonKey(ignore: true)
  _$LocationCopyWith<_Location> get copyWith =>
      throw _privateConstructorUsedError;
}
