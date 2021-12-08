// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'character_bloc.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CharacterStateLoading _$$CharacterStateLoadingFromJson(
        Map<String, dynamic> json) =>
    _$CharacterStateLoading(
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$CharacterStateLoadingToJson(
        _$CharacterStateLoading instance) =>
    <String, dynamic>{
      'runtimeType': instance.$type,
    };

_$CharacterStateLoaded _$$CharacterStateLoadedFromJson(
        Map<String, dynamic> json) =>
    _$CharacterStateLoaded(
      characterLoaded:
          Character.fromJson(json['characterLoaded'] as Map<String, dynamic>),
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$CharacterStateLoadedToJson(
        _$CharacterStateLoaded instance) =>
    <String, dynamic>{
      'characterLoaded': instance.characterLoaded,
      'runtimeType': instance.$type,
    };

_$CharacterStateError _$$CharacterStateErrorFromJson(
        Map<String, dynamic> json) =>
    _$CharacterStateError(
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$CharacterStateErrorToJson(
        _$CharacterStateError instance) =>
    <String, dynamic>{
      'runtimeType': instance.$type,
    };
