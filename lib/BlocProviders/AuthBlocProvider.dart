import 'package:divvy/Blocs/AuthBloc.dart';
export 'package:divvy/Blocs/AuthBloc.dart';
import 'package:flutter/material.dart';

class AuthBlocProvider extends InheritedWidget{
  final bloc = AuthBloc();

  AuthBlocProvider({Key key, Widget child}) : super(key: key, child: child);

  bool updateShouldNotify(_) => true;

  static AuthBloc of(BuildContext context) {
    return (context.inheritFromWidgetOfExactType(AuthBlocProvider) as AuthBlocProvider).bloc;
  }
}