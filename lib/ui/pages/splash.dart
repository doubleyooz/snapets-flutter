import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:snapets/ui/pages/home.dart';
import 'package:snapets/ui/pages/welcome.dart';
import 'package:snapets/ui/themes/theme.dart';


class SplashPage extends StatefulWidget {
  SplashPage({Key? key}) : super(key: key);

  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      timer();
    });
    super.initState();
  }

  /// Check if current app is updated app or not
  /// If app is not updated then redirect user to update app screen
  void timer() async {
    final isAppUpdated = true;
    
  }

  /// Return installed app version
  /// For testing purpose in debug mode update screen will not be open up
  /// If an old version of app is installed on user's device then
  /// User will not be able to see home screen
  /// User will redirected to update app screen.
  /// Once user update app with latest verson and back to app then user automatically redirected to welcome / Home page
  /*Future<bool> _checkAppVersion() async {
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    final currentAppVersion = "${packageInfo.version}";
    final appVersion = await _getAppVersionFromFirebaseConfig();
    if (appVersion != currentAppVersion) {
      if (kDebugMode) {
        cprint("Latest version of app is not installed on your system");
        cprint(
            "In debug mode we are not restrict devlopers to redirect to update screen");
        cprint(
            "Redirect devs to update screen can put other devs in confusion");
        return true;
      }
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (_) => UpdateApp(),
        ),
      );
      return false;
    } else {
      return true;
    }
  }*/

  /// Returns app version from firebase config
  /// Fecth Latest app version from firebase Remote config
  /// To check current installed app version check [version] in pubspec.yaml
  /// you have to add latest app version in firebase remote config
  /// To fetch this key go to project setting in firebase
  /// Open `Remote Config` section in fireabse
  /// Add [appVersion]  as paramerter key and below json in Default value
  ///  ``` json
  ///  {
  ///    "key": "1.0.0"
  ///  } ```
  /// After adding app version key click on Publish Change button
  /// For package detail check:-  https://pub.dev/packages/firebase_remote_config#-readme-tab-
  /*Future<String> _getAppVersionFromFirebaseConfig() async {
    final RemoteConfig remoteConfig = await RemoteConfig.instance;
    await remoteConfig.fetchAndActivate();
    // await remoteConfig.activateFetched();
    var data = remoteConfig.getString('appVersion');
    if (data != null && data.isNotEmpty) {
      return jsonDecode(data)["key"];
    } else {
      cprint(
          "Please add your app's current version into Remote config in firebase",
          errorIn: "_getAppVersionFromFirebaseConfig");
      return null;
    }
  }*/

  Widget _body() {
    var height = 150.0;
    return Container(
      height: height,
      width: 150.0,
      child: Container(
        height: height,
        width: height,
        alignment: Alignment.center,
        child: Container(
          padding: EdgeInsets.all(50),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(
              Radius.circular(10),
            ),
          ),
          child: Stack(
            alignment: Alignment.center,
            children: <Widget>[
              Platform.isIOS
                  ? CupertinoActivityIndicator(
                      radius: 35,
                    )
                  : CircularProgressIndicator(
                      strokeWidth: 2,
                    ),
              Image.asset(
                'assets/images/icon-480.png',
                height: 30,
                width: 30,
              )
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    var state = true;
    return Scaffold(
      backgroundColor: Colors.white,
      body: state == true
          ? _body()
          : state == false
              ? WelcomePage()
              : HomePage(),
    );
  }
}