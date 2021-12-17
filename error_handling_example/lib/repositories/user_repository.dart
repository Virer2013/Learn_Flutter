import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:error_handling_example/failure.dart';
import 'package:error_handling_example/models/user.dart';
import 'package:http/http.dart' as http;

class UserRepository {
  Future<List<User>?> getUsers() async {
    try {
      final response = await http
          .get(Uri.parse('https://jsonplaceholder.typicode.com/users'));

      var json = jsonDecode(response.body);
      List<User> users =
          List<User>.from(json.map((json) => User.fromJson(json)));

      //! No Internet Connection
      // throw const SocketException('Error Internet');

      //! 404
      // throw const HttpException('404');

      //! Invalid JSON (throws FormatException)
      // throw const FormatException('JSON error');

      return users;
    } on SocketException {
      throw const Failure('No Internet connection 😑');
    } on HttpException {
      throw const Failure('Could not find the users 😱');
    } on FormatException {
      throw const Failure('Bad response format 👎');
    }
  }
}
