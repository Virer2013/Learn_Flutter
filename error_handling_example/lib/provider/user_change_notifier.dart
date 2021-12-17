import 'package:error_handling_example/failure.dart';
import 'package:error_handling_example/models/user.dart';
import 'package:error_handling_example/repositories/user_repository.dart';
import 'package:flutter/cupertino.dart';

enum NotifierState { initial, loading, loaded }

class UserChangeNotifier extends ChangeNotifier {
  final _userRepository = UserRepository();

  NotifierState _state = NotifierState.initial;
  NotifierState get state => _state;
  void _setState(NotifierState state) {
    _state = state;
    notifyListeners();
  }

  late List<User> _users;
  List<User> get users => _users;
  void _setUsers(List<User> users) {
    _users = users;
    notifyListeners();
  }

  Failure? _failure;
  Failure? get failure => _failure;
  void _setFailure(Failure failure) {
    _failure = failure;
    notifyListeners();
  }

  void getUsers() async {
    _setState(NotifierState.loading);

    try {
      final users = await _userRepository.getUsers();
      if (users != null) {
        _setUsers(users);
      }
    } on Failure catch (f) {
      _setFailure(f);
    }

    _setState(NotifierState.loaded);
  }
}