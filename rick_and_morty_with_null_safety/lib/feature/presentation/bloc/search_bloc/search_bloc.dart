// ignore_for_file: constant_identifier_names

import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_and_morty_with_null_safety/core/error/failure.dart';
import 'package:rick_and_morty_with_null_safety/feature/domain/usecases/search_person.dart';
import 'package:rick_and_morty_with_null_safety/feature/presentation/bloc/search_bloc/search_event.dart';
import 'package:rick_and_morty_with_null_safety/feature/presentation/bloc/search_bloc/search_state.dart';

const SERVER_FAILURE_MESSAGE = 'Server Failure';
const CACHED_FAILURE_MESSAGE = 'Cache Failure';

// BLoC 8.0.0
class PersonSearchBloc extends Bloc<PersonSearchEvent, PersonSearchState> {
  final SearchPerson searchPerson;

  PersonSearchBloc({required this.searchPerson}) : super(PersonSearchEmpty()) {
    on<SearchPersons>(_onEvent);
  }

  FutureOr<void> _onEvent(
      SearchPersons event, Emitter<PersonSearchState> emit) async {
    emit(PersonSearchLoading());
    final failureOrPerson =
        await searchPerson(SearchPersonParams(query: event.personQuery));
    emit(failureOrPerson.fold(
        (failure) => PersonSearchError(message: _mapFailureToMessage(failure)),
        (person) => PersonSearchLoaded(persons: person)));
  }

    String _mapFailureToMessage(Failure failure) {
    switch (failure.runtimeType) {
      case ServerFailure:
        return SERVER_FAILURE_MESSAGE;
      case CacheFailure:
        return CACHED_FAILURE_MESSAGE;
      default:
        return 'Unexpected Error';
    }
  }
}

// BLoC 7.2.0
// class PersonSearchBloc extends Bloc<PersonSearchEvent, PersonSearchState> {
//   final SearchPerson searchPerson;

//   PersonSearchBloc({required this.searchPerson}) : super(PersonSearchEmpty());

//   @override
//   Stream<PersonSearchState> mapEventToState(PersonSearchEvent event) async* {
//     if (event is SearchPersons) {
//       yield* _mapFetchPersonsToState(event.personQuery);
//     }
//   }

//   Stream<PersonSearchState> _mapFetchPersonsToState(String personQuery) async* {
//     yield PersonSearchLoading();

//     final failureOrPerson =
//         await searchPerson(SearchPersonParams(query: personQuery));

//     yield failureOrPerson.fold(
//         (failure) => PersonSearchError(message: _mapFailureToMessage(failure)),
//         (person) => PersonSearchLoaded(persons: person));
//   }

  // String _mapFailureToMessage(Failure failure) {
  //   switch (failure.runtimeType) {
  //     case ServerFailure:
  //       return SERVER_FAILURE_MESSAGE;
  //     case CacheFailure:
  //       return CACHED_FAILURE_MESSAGE;
  //     default:
  //       return 'Unexpected Error';
  //   }
  // }
// }
