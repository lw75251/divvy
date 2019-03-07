import 'dart:async';
import 'package:divvy/models/user.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:http/http.dart' show Client;
import 'dart:convert';

class UserApiProvider {
  final baseUrl = "http://localhost:3000";
  Client client = Client();

  Future<User> getUser(String uid) async {
    final url = baseUrl + "/users/$uid";
    final response = await client.get(url);

    if (response.statusCode == 200) {
      return User.fromJson(json.decode(response.body));
    } else {
      throw new Exception("Failed to get User");
    }
  }

  Future<bool> registerUser(FirebaseUser firebaseUser) async {
    final url = baseUrl + "/users";

    User user = new User(
      firebaseUser.uid,
      firebaseUser.displayName,
      firebaseUser.email,
      firebaseUser.photoUrl,
      firebaseUser.phoneNumber,
    );

    final response = await client.post(url, body: user.toJson());
    if (response.statusCode == 200) {
      print(response.body.toString());
      return true;
    } else {
      // throw new Exception("Failed to register User");
      return false;
    }
  }
}
