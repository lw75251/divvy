
import 'package:divvy/service/auth.dart';
import 'package:divvy/ui/Login/sign_in_form.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

// class LoginButton extends StatelessWidget {

//   @override
//   Widget build(BuildContext context) {
//     return StreamBuilder(
//         stream: authService.user,
//         builder: (context, snapshot) {
//           if (snapshot.hasData) {
//             return MaterialButton(
//               onPressed: () => authService.signOut(),
//               color: Colors.red,
//               textColor: Colors.white,
//               child: Text('Signout'),
//             );
//           } else {
//             return MaterialButton(
//               onPressed: () => authService.googleSignIn(),
//               color: Colors.white,
//               textColor: Colors.black,
//               child: Text('Login with Social Media'),
//             );
//           }
//         });
//   }
// }

class LoginPage extends StatefulWidget {
  final Widget child;

  LoginPage({Key key, this.child}) : super(key: key);

  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage>
    with SingleTickerProviderStateMixin {
  AnimationController _iconAnimationController;
  Animation<double> _iconAnimation;

  final topBar = new AppBar(
    centerTitle: true,
    elevation: 1.0,
    leading: new Icon(Icons.account_balance_wallet),
    title: new Text("Divvy", style: TextStyle(fontWeight: FontWeight.bold)),
    actions: <Widget>[
      new IconButton(
        icon: new Icon(FontAwesomeIcons.signInAlt),
        tooltip: "Sign In",
        onPressed: () => authService.googleSignIn(),
      )
    ],
  );

  @override
  void initState() {
    super.initState();
    _iconAnimationController = new AnimationController(
        vsync: this, duration: new Duration(milliseconds: 500));
    _iconAnimation = new CurvedAnimation(
        parent: _iconAnimationController, curve: Curves.easeOutCubic);
    _iconAnimation.addListener(() => this.setState(() {}));
    _iconAnimationController.forward();
  }

  // @override
  // Widget build(BuildContext context) {
  //   return Container(
  //     // padding: EdgeInsets.all(16.0),
  //     // decoration: BoxDecoration(
  //     //     color: Colors.amber
  //     // ),
  //     // alignment: Alignment(0.0,0.0),
  //     child: SignInForm(),
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: topBar,
        body: new Stack(
          fit: StackFit.expand,
          children: <Widget>[
            Container(
              color: Color(0xFF1D1E18),
              child: new Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  new FlutterLogo(size: _iconAnimation.value * 100),
                  new SignInForm()
                ],
              ),
            )
          ],
        ));
  }
}