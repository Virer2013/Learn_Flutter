import 'package:dartz/dartz.dart';
import 'package:rick_and_morty_flutter_3/core/error/failure.dart';
import 'package:rick_and_morty_flutter_3/feature/domain/entities/person_entity.dart';

abstract class PersonRepository {
  Future<Either<Failure, List<PersonEntity>>> getAllPersons(int page);
  Future<Either<Failure, List<PersonEntity>>> searchPerson(String query);
}
