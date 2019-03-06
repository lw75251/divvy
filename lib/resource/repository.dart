import 'dart:async';
import 'package:divvy/api/UserApiProvider.dart';
import 'package:divvy/models/user.dart';

class Repository {
  final userApiProvider = UserApiProvider();

  Future<User> fetchUser(uid) => userApiProvider.getUser(uid);
}