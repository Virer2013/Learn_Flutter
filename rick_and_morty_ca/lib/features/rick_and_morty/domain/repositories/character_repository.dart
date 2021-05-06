import 'package:dartz/dartz.dart';
import '../../../../core/error/failure.dart';
import '../entities/character_entity.dart';

abstract class PersonRepository {
  Future<Either<Failure, List<PersonEntity>>> getAllPersons(int page);
  Future<Either<Failure, List<PersonEntity>>> searchPerson(String query);
}
