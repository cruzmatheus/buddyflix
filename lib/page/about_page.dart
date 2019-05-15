import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AboutPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
      children: <Widget>[
        Container(
          padding: EdgeInsets.only(top: 50),
          child: CircleAvatar(
            backgroundImage: ExactAssetImage('assets/me.jpg'),
            minRadius: 90,
            maxRadius: 90,
          ),
        ),
        Container(
            padding: EdgeInsets.only(top: 15),
            child: Text(
              "Hi, I'm Matheus",
              style: TextStyle(fontFamily: 'Montserrat-Bold', fontSize: 30),
            )),
        Container(
            padding: EdgeInsets.only(top: 15),
            child: Text(
              "Thank you for download this app!",
              style: TextStyle(fontFamily: 'Montserrat-Bold', fontSize: 15),
            )),
        Container(
            padding: EdgeInsets.all(15),
            child: Text(
              "I'm a Java Software Engineer and this app is one of my first Flutter apps. I've had a great time building it and if you'd like to get in touch, here are my contacts:",
              style: TextStyle(fontFamily: 'Montserrat-Light', fontSize: 15),
              textAlign: TextAlign.justify,
            )),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(top: 15),
              child: Icon(Icons.email),
            ),
            Container(
              padding: EdgeInsets.only(top: 15, left: 10),
              child: Text("contato.mscruz@gmail.com"),
            )
          ],
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(top: 15),
              height: 50,
              child: Image(
                color: Colors.white,
                image: AssetImage("assets/octocat.png"),
              ),
            ),
            Container(
              padding: EdgeInsets.only(top: 15, left: 10),
              child: Text("cruzmatheus"),
            )
          ],
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(top: 15),
              height: 50,
              child: Image(
                color: Colors.white,
                image: AssetImage("assets/linkedin.png"),
              ),
            ),
            Container(
              padding: EdgeInsets.only(top: 15, left: 10),
              child: Text("/scmatheus"),
            )
          ],
        )
      ],
    ));
  }
}
