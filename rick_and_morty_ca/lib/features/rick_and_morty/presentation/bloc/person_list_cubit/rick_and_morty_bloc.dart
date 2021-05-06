import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../../../../../core/error/failure.dart';
import '../../../domain/entities/character_entity.dart';
import '../../../domain/usecases/get_characters.dart';
import 'rick_and_morty_state.dart';

const String SERVER_FAILURE_MESSAGE = 'Server Failure';
const String CACHE_FAILURE_MESSAGE = 'Cache Failure';

class PersonsListCubit extends Cubit<PersonState> {
  final GetAllPersons getAllPersons;
  PersonsListCubit({@required this.getAllPersons}) : super(PersonInitial());

  int page = 1;

  void loadPerson() async {
    if (state is PersonLoading) return;

    final currentState = state;

    var oldPerson = <PersonEntity>[];
    if (currentState is PersonLoaded) {
      oldPerson = currentState.personList;
    }

    emit(PersonLoading(oldPerson, isFirstFetch: page == 1));

    final failureOrPerson =
        await getAllPersons(PagePersonParams(page: page));

    failureOrPerson.fold((err) => PersonError(message: _mapFailureToMessage(err)), (character) {
      page++;
      final person = (state as PersonLoading).oldPersonList;
      person.addAll(character);
      print('List length: ${person.length.toString()}');
      emit(PersonLoaded(person));
    });
  }

  String _mapFailureToMessage(Failure failure) {
    switch (failure.runtimeType) {
      case ServerFailure:
        return SERVER_FAILURE_MESSAGE;
      case CacheFailure:
        return CACHE_FAILURE_MESSAGE;
      default:
        return 'Unexpected Error';
    }
  }
}
