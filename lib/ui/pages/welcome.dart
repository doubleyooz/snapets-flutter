import 'package:flutter/material.dart';
import 'package:snapets/ui/pages/login.dart';

class WelcomePage extends StatefulWidget {
  @override
  _Screen createState() => _Screen();
}

class _Screen extends State<WelcomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        child: Container(
          decoration: BoxDecoration(
            //borderRadius: BorderRadius.all(Radius.circular(5)),
            /*boxShadow: <BoxShadow>[
                  BoxShadow(
                      color: Colors.blue[50],
                      offset: Offset(2, 4),
                      blurRadius: 5,
                      spreadRadius: 2)
              ],*/
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Color(0xff5be3c5), Color(0xff4aedc9)]),
          ),
          child: Stack(
            children: [
              Positioned(
                bottom: -95,
                child: _backgroundAnimated(),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20),
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _title(),
                    SizedBox(
                      height: 80,
                    ),
                    _loginButton(),
                    SizedBox(
                      height: 20,
                    ),
                    _registerButton(),
                    SizedBox(
                      height: 20,
                    ),
                    _label(),
                    //
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _title() {
    return Wrap(
      direction: Axis.vertical,
      spacing: -10,
      runSpacing: 0,
      children: <Widget>[
        RichText(
          textAlign: TextAlign.center,
          text: TextSpan(
            text: 'Sna',
            style: TextStyle(
              fontFamily: 'FiraCode',
              fontSize: 32,
              fontWeight: FontWeight.w700,
              color: Colors.white,
            ),
            children: [
              TextSpan(
                  text: 'Pets',
                  style: TextStyle(
                    fontFamily: 'Reindeer',
                    fontSize: 37,
                    fontWeight: FontWeight.w700,
                    color: Color(0xff438d91),
                  ))
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.fromLTRB(24, 0, 0, 0),
          child: RichText(
            textAlign: TextAlign.right,
            text: TextSpan(
              text: 'Waifu_Forever',
              style: TextStyle(
                fontFamily: 'FiraCode',
                fontSize: 10,
                fontWeight: FontWeight.w700,
                color: Colors.black,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _loginButton() {
    return InkWell(
      onTap: () => {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => LoginPage()),
        )
      },
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: 30,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: Color(0xffb9dcf0),
        ),
        child: Text(
          'Login',
          style: TextStyle(fontSize: 18, color: Colors.black),
        ),
      ),
    );
  }

  Widget _registerButton() {
    return InkWell(
      onTap: () => {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => LoginPage()),
        )
      },
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: 30,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: Color(0xffb9dcf0),
        ),
        child: Text(
          'Register Now',
          style: TextStyle(fontSize: 18, color: Colors.black),
        ),
      ),
    );
  }

  Widget _label() {
    return Container(
      child: Column(
        children: [
          SizedBox(height: 40),
          Text('Quick Login with Touch ID'),
          SizedBox(height: 20),
          InkWell(
            onTap: () => {
              /*Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => LoginPage()),
              )*/
            },
            child: Icon(
              Icons.fingerprint,
              size: 90,
              color: Colors.black,
            ),
          ),
          SizedBox(height: 20),
          Text(
            'Use Touch ID',
            style: TextStyle(decoration: TextDecoration.underline),
          ),
        ],
      ),
    );
  }

  Widget _backgroundAnimated() {
    return TweenAnimationBuilder(
      duration: Duration(seconds: 5),
      tween: Tween<double>(begin: 0, end: 34),
      builder: (_, double y, __) {
        return Transform.translate(
          offset: Offset(0, -y),
          child: Container(
            width: MediaQuery.of(context).size.width,
            child: Opacity(
              opacity: 0.75,
              child: Image.asset("assets/images/dog.png"),
            ),
          ),
        );
      },
    );
  }
}
