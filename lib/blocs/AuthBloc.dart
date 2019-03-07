import 'dart:async';
import 'package:divvy/resource/repository.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:rxdart/rxdart.dart';

class AuthBloc {
  final _repository = Repository();
  final _firebaseUser = BehaviorSubject<FirebaseUser>();
  final _isSignedIn = BehaviorSubject<bool>();

  Observable<FirebaseUser> get firebaseUser => _firebaseUser.stream;

  Future<FirebaseUser> signIn() async {
    FirebaseUser user = await _repository.googleSignIn();
    _firebaseUser.add(user);
    return user;
  } 

  Future<void> signOut() => _repository.googleSignOut();

  void dispose() async {
    await _firebaseUser.drain();
    _firebaseUser.close();
    await _isSignedIn.drain();
    _isSignedIn.close();
  }

}