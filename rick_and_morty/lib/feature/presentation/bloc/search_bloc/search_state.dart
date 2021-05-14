import 'package:equatable/equatable.dart';
import 'package:rick_and_morty/feature/domain/entities/person_entity.dart';
import 'package:meta/meta.dart';

abstract class PersonSearchState extends Equatable {
  const PersonSearchState();

  @override
  List<Object> get props => [];
}

class PersonSearchEmpty extends PersonSearchState {}

class PersonSearchLoading extends PersonSearchState {}

class PersonSearchLoaded extends PersonSearchState {
  final List<PersonEntity> persons;

  PersonSearchLoaded({this.persons});

  @override
  List<Object> get props => [persons];
}

class PersonSearchError extends PersonSearchState {
  final String message;

  PersonSearchError({@required this.message});

  @override
  List<Object> get props => [message];
}
