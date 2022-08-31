import 'package:tdd_example/entities/user.dart';
import 'package:tdd_example/repository_interface/i_user_repository.dart';

class LocalUserRepository implements IUserRepository {
  @override
  Future<User?> getUser(int id) async {
    return User(id: id);
  }
}