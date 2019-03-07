
import 'package:divvy/BlocProviders/AuthBlocProvider.dart';
import 'package:divvy/BlocProviders/LoginBlocProvider.dart';
import 'package:divvy/Blocs/AuthBloc.dart';
import '../../utils/strings.dart';
import 'package:flutter/material.dart';

class SignInForm extends StatefulWidget {
  @override
  SignInFormState createState() {
    return SignInFormState();
  }
}

class SignInFormState extends State<SignInForm> {
  LoginBloc _loginBloc;
  AuthBloc _authBloc;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _loginBloc = LoginBlocProvider.of(context);
    _authBloc = AuthBlocProvider.of(context);
  }

  @override
  void dispose() {
    _loginBloc.dispose();
    _authBloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        submitButton()
      ],
    );
  }

  Widget submitButton() {
    return StreamBuilder(
        stream: _loginBloc.signInStatus,
        builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
          if (!snapshot.hasData || snapshot.hasError) {
            return button();
          } else {
            return CircularProgressIndicator();
          }
        });
  }

  Widget button() {
    return RaisedButton(
        child: Text(StringConstant.submit),
        textColor: Colors.white,
        color: Colors.black,
        shape: RoundedRectangleBorder(
            borderRadius: new BorderRadius.circular(30.0)),
        onPressed: () => authenticateUser()
        );
  }

  void authenticateUser() {
    _loginBloc.showProgressBar(true);
    _authBloc.signIn().then( (user) => {
      _loginBloc.registerUser(user).then( (res) {
        if ( res ) {
          // Navigator.pushReplacement(
          //   context,
          //   MaterialPageRoute(builder: (context) => NEXTPAGE)
          // )
            _loginBloc.showProgressBar(false);
        } else {
          showErrorMessage();
        }
      })
    });
  }

  void showErrorMessage() {
    final snackbar = SnackBar(
        content: Text(StringConstant.errorMessage),
        duration: new Duration(seconds: 2));
    Scaffold.of(context).showSnackBar(snackbar);
  }
}