import 'package:cubit_network_example/models/user.dart';
import 'package:cubit_network_example/services/user_api_provider.dart';

class UsersRepository {
  UserProvider _usersProvider = UserProvider();
  Future<List<User>> getAllUsers() => _usersProvider.getUser();
}