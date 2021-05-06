import 'package:data_connection_checker/data_connection_checker.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import 'core/network/network_info.dart';
import 'features/rick_and_morty/data/datasources/character_local_datasource.dart';
import 'features/rick_and_morty/data/datasources/character_remote_datasource.dart';
import 'features/rick_and_morty/data/repositories/character_repository_impl.dart';
import 'features/rick_and_morty/domain/repositories/character_repository.dart';
import 'features/rick_and_morty/domain/usecases/get_characters.dart';
import 'features/rick_and_morty/domain/usecases/search_person.dart';
import 'features/rick_and_morty/presentation/bloc/person_list_cubit/rick_and_morty_bloc.dart';
import 'features/rick_and_morty/presentation/bloc/search_bloc/search_bloc.dart';

final sl = GetIt.instance;

Future<void> init() async {
  // Bloc
  sl.registerFactory(
    () => PersonsListCubit(getAllPersons: sl()),
  );
  sl.registerFactory(
    () => PersonSearchBloc(searchPerson: sl()),
  );

  // UseCases
  sl.registerLazySingleton(() => GetAllPersons(sl()));
  sl.registerLazySingleton(() => SearchPerson(sl()));

  // Repository
  sl.registerLazySingleton<PersonRepository>(
    () => PersonRepositoryImpl(
      remoteDataSource: sl(),
      localDataSource: sl(),
      networkInfo: sl(),
    ),
  );

  sl.registerLazySingleton<PersonRemoteDataSource>(
    () => PersonRemoteDataSourceImpl(
      client: http.Client(),
    ),
  );

  sl.registerLazySingleton<PersonLocalDataSource>(
    () => PersonsLocalDataSourceImpl(sharedPreferences: sl()),
  );

  // Core
  sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(sl()));

  // External
  final sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton(() => sharedPreferences);
  sl.registerLazySingleton(() => http.Client());
  sl.registerLazySingleton(() => DataConnectionChecker());
}
