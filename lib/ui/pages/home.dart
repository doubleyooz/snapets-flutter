import 'package:flutter/material.dart';
import 'package:snapets/ui/pages/login.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Drawer  test'),
        backgroundColor: Colors.deepOrange,
      ),
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                  gradient: LinearGradient(colors: <Color>[
                Colors.deepOrange,
                Colors.orangeAccent,
              ])),
              child: Container(
                child: Column(
                  children: <Widget>[
                    Container(
                      width: 96,
                      height: 96,
                      decoration: new BoxDecoration(
                        shape: BoxShape.circle,
                        image: new DecorationImage(
                          fit: BoxFit.fill,
                          image: new ExactAssetImage('assets/images/logo.jpeg'),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        'Flutter',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 21.0,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            CustomListTile(Icons.person, "Profile", () => {}),
            CustomListTile(Icons.notifications, "Notifications", () => {}),
            CustomListTile(Icons.settings, "Settings", () => {}),
            CustomListTile(
                Icons.exit_to_app,
                "Log Out",
                () => {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => LoginPage()),
                      )
                    }),
          ],
        ),
      ),
    );
  }
}

class CustomListTile extends StatelessWidget {
  IconData icon;
  String text;
  final VoidCallback onTap;

  CustomListTile(this.icon, this.text, this.onTap);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(8.0, 0, 8.0, 0),
      child: Container(
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(color: Colors.grey.shade100),
          ),
        ),
        child: InkWell(
          splashColor: Colors.orangeAccent,
          onTap: onTap,
          child: Container(
            height: 50,
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Row(children: <Widget>[
                    Icon(icon),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        text,
                        style: TextStyle(fontSize: 16.0),
                      ),
                    )
                  ]),
                  Icon(Icons.arrow_right),
                ]),
          ),
        ),
      ),
    );
  }
}
