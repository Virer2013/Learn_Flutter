import 'dart:convert';

import 'package:meta/meta.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../core/error/exception.dart';
import '../models/character_model.dart';

abstract class PersonLocalDataSource {
  /// Gets the cached [PersonModel] which was gotten the last time
  /// the user had an internet connection.
  /// 
  /// Throws [CacheException] if no cached data is present.
  Future<List<PersonModel>> getLastPersonsFromCache();
  
  Future<void> personsToCache(List<PersonModel> persons);
}

const CACHED_PERSONS_LIST = 'CACHED_PERSONS_LIST';

class PersonsLocalDataSourceImpl implements PersonLocalDataSource {
  final SharedPreferences sharedPreferences;

  PersonsLocalDataSourceImpl({@required this.sharedPreferences});

  @override
  Future<List<PersonModel>> getLastPersonsFromCache() {
    final jsonPersonsList =
        sharedPreferences.getStringList(CACHED_PERSONS_LIST);
    print('Get Persons from Cache: ${jsonPersonsList.length}');
    if (jsonPersonsList.isNotEmpty) {
      return Future.value(jsonPersonsList
          .map((j) => PersonModel.fromJson(json.decode(j)))
          .toList());
    } else {
      throw CacheException();
    }
  }

  @override
  Future<void> personsToCache(List<PersonModel> persons) {
    final jsonPersonsList =
        persons.map((c) => json.encode(c.toJson())).toList();

    sharedPreferences.setStringList(CACHED_PERSONS_LIST, jsonPersonsList);
    print('Persons to write Cache: ${jsonPersonsList.length}');
    return Future.value(jsonPersonsList);
  }
}
