import 'package:equatable/equatable.dart';
import 'package:rick_and_morty/feature/domain/entities/person_entity.dart';
import 'package:meta/meta.dart';

abstract class PersonState extends Equatable {
  const PersonState();

  @override
  List<Object> get props => [];
}

class PersonEmpty extends PersonState {
  @override
  List<Object> get props => [];
}

class PersonLoading extends PersonState {
  final List<PersonEntity> oldPersonsList;
  final bool isFirstFetch;

  PersonLoading(this.oldPersonsList, {this.isFirstFetch = false});

  @override
  List<Object> get props => [oldPersonsList];
  
}

class PersonLoaded extends PersonState {
  final List<PersonEntity> personsList;

  PersonLoaded(this.personsList);

  @override
  List<Object> get props => [personsList];
}

class PersonError extends PersonState {
  final String message;

  PersonError({@required this.message});
  
  @override
  List<Object> get props => [message];
}