import 'package:dartz/dartz.dart';
import 'package:rick_and_morty_with_null_safety/core/error/failure.dart';
import 'package:rick_and_morty_with_null_safety/feature/domain/entities/person_entity.dart';

abstract class PersonRepository {
  Future<Either<Failure, List<PersonEntity>>> getAllPersons(int page);
  Future<Either<Failure, List<PersonEntity>>> searchPerson(String query);
}
