import 'dart:async';
import 'package:divvy/models/user.dart';
import 'package:divvy/resource/repository.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:rxdart/rxdart.dart';

class LoginBloc {
  final _repository = Repository();
  final _user =BehaviorSubject<User>();
  final _isSignedIn = BehaviorSubject<bool>();

  Observable<User> get user => _user.stream;
  Observable<bool> get signInStatus => _isSignedIn.stream;
  Function(bool) get showProgressBar => _isSignedIn.sink.add;


  // NOTE: If we need to perform any validation before sending POST request to make user, use this code
  // Observable<User> get user => _user.stream.transform(_validateUser);
  // final _validateUser = StreamTransformer<User, User>.fromHandlers(handleData: (user, sink) {
  //   if (user.uid != null) {
  //     sink.add(user);
  //   } else {
  //     sink.addError(StringConstant.userValidateMessage);
  //   }
  // });

  Future<bool> registerUser(FirebaseUser user) => _repository.registerUser(user);

  void dispose() async {
    await _user.drain();
    _user.close();
    await _isSignedIn.drain();
    _isSignedIn.close();
  }

  // NOTE: Blocs should validate fields if needed
  // bool validateFields() {
  //   if (_email.value != null &&
  //       _email.value.isNotEmpty &&
  //       _password.value != null &&
  //       _password.value.isNotEmpty &&
  //       _email.value.contains('@') &&
  //       _password.value.length > 3) {
  //     return true;
  //   } else {
  //     return false;
  //   }
  // }
}