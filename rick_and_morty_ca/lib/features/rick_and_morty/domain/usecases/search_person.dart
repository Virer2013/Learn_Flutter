import 'package:dartz/dartz.dart';
import 'package:meta/meta.dart';

import '../../../../core/error/failure.dart';
import '../../../../core/usecase/usecase.dart';
import '../entities/character_entity.dart';
import '../repositories/character_repository.dart';

class SearchPerson implements UseCase<List<PersonEntity>, SearchPersonParams> {
  final PersonRepository repository;

  SearchPerson(this.repository);

  @override
  Future<Either<Failure,List<PersonEntity>>> call(SearchPersonParams params) async {
    return await repository.searchPerson(
      params.query
    );
  }
}

class SearchPersonParams {
  final String query;

  SearchPersonParams({@required this.query});
}