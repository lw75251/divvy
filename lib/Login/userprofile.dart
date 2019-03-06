
import 'package:divvy/service/auth.dart';
import 'package:flutter/material.dart';

class UserProfile extends StatefulWidget {
  _UserProfileState createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  Map<String, dynamic> _profile;
  bool _loading = false;

  @override
  void initState() {
    super.initState();
    authService.profile
      .listen((state)=> setState( () => _profile = state ));

    authService.loading
      .listen((state)=> setState( () => _loading = state ));
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          padding: EdgeInsets.all(20),
          child: Text(_profile.toString()),
        ),
        Text(_loading.toString())
      ],
    );
  }
}