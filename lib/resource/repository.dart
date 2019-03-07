import 'dart:async';
import 'package:divvy/ApiProviders/UserApiProvider.dart';
import 'package:divvy/models/user.dart';
import 'package:divvy/providers/AuthProvider.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Repository {
  final _userApiProvider = UserApiProvider();
  final _authProvider = AuthProvider();

  /// AuthProvider Methods */
  Future<FirebaseUser> googleSignIn() => _authProvider.googleSignIn();
  Future<void> googleSignOut() => _authProvider.googleSignOut();

  /// UserApiProvider Methods */
  Future<User> fetchUser(uid) => _userApiProvider.getUser(uid);
  Future<bool> registerUser(FirebaseUser user) => _userApiProvider.registerUser(user);
}
