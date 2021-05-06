import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import '../../../../core/error/failure.dart';
import '../../../../core/usecase/usecase.dart';
import '../entities/character_entity.dart';
import '../repositories/character_repository.dart';

class GetAllPersons extends UseCase<List<PersonEntity>, PagePersonParams>{
  final PersonRepository personsRepository;

  GetAllPersons(this.personsRepository);

  Future<Either<Failure, List<PersonEntity>>> call(PagePersonParams params) async {
    return personsRepository.getAllPersons(params.page);
  }
}

class PagePersonParams extends Equatable {
  final int page;

  PagePersonParams({@required this.page});

  @override
  List<Object> get props => [page];
}