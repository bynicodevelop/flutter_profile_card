# flutter_profile_card

This plugin allows you to display a user profile with its followers and followings.

Also allows to have a button to follow the user profile.

## Getting Started

```
import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter/services.dart';
import 'package:flutter_profile_card/flutter_profile_card.dart';
import 'package:flutter_profile_card/models/Profile.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool _isFollow = false;
  ProfileModel _profileModel;

  @override
  void initState() {
    // Define the model
    _profileModel = ProfileModel(
      uid: '1234567890',
      username: 'John Doe',
      status: 'John doe is certainly the best development but very discreet...',
      avatarURL: 'https://picsum.photos/200',
      followers: 1,
      followings: 1234,
    );

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        accentColor: Colors.green,
        textTheme: TextTheme(
          bodyText2: TextStyle(
            fontSize: 16.0,
          ),
        ),
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: ProfileCard(
          // Add the model in the widget parameter
          profile: _profileModel,
          // Capture the follow event
          onFollowed: (ProfileModel profile) {
            print(profile.toJson());
            setState(() {
              // Database code...
              _isFollow = !_isFollow;

              _profileModel.isFollowed = _isFollow;
              _profileModel.updateFollowers = _isFollow ? 2 : 1;
            });
          },
        ),
      ),
    );
  }
}

```
