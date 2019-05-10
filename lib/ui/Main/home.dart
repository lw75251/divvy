import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // final topBar = new AppBar(
  //   centerTitle: true,
  //   elevation: 1.0,
  //   leading: new Icon(Icons.account_balance_wallet),
  //   title: new Text("Divvy", style: TextStyle(fontWeight: FontWeight.bold)),
  //   actions: <Widget>[
  //     new IconButton(
  //       icon: new Icon(FontAwesomeIcons.signInAlt),
  //       tooltip: "Sign In",
  //       onPressed: () {},
  //     )
  //   ],
  // );

  final topBar = new AppBar(
    elevation: 1.0,
    leading: new Icon(FontAwesomeIcons.bars),
  );

  final drawer = new Drawer(
      child: new ListView(
    children: <Widget>[
      new UserAccountsDrawerHeader(
        accountName: new Text("Leon Wu"),
        currentAccountPicture: new CircleAvatar(
          backgroundColor: Colors.black,
        ),
        accountEmail: null,
      )
    ],
  ));

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: topBar,
      body: Center(
        child: new Text("data"),
      ),
    );
  }
}
