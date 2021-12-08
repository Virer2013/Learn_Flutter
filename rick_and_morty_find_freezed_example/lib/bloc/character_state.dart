part of 'character_bloc.dart';

@freezed
class CharacterState with _$CharacterState {
  const factory CharacterState.loading() = CharacterStateLoading;
  const factory CharacterState.loaded({required Character characterLoaded}) = CharacterStateLoaded;
  const factory CharacterState.error() = CharacterStateError;

  factory CharacterState.fromJson(Map<String, dynamic> json) => _$CharacterStateFromJson(json);
}