import 'package:divvy/Blocs/LoginBloc.dart';
export 'package:divvy/Blocs/LoginBloc.dart';
import 'package:flutter/material.dart';

class LoginBlocProvider extends InheritedWidget{
  final bloc = LoginBloc();

  LoginBlocProvider({Key key, Widget child}) : super(key: key, child: child);

  bool updateShouldNotify(_) => true;

  static LoginBloc of(BuildContext context) {
    return (context.inheritFromWidgetOfExactType(LoginBlocProvider) as LoginBlocProvider).bloc;
  }
}