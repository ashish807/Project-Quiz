import 'package:flutter/material.dart';
import '../main.dart';
import './home.dart';
import '../style/theme.dart' as Theme;

class Flight extends StatefulWidget {
  @override
  FlightState createState() {
    return new FlightState();
  }
}

class FlightState extends State<Flight> {
  var _alignment = Alignment.bottomCenter;
  var text = "Click Take Flight ";

  nextpage() {
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (val) => Home()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Dream High, Fly High"),
        backgroundColor: Colors.pinkAccent,
        actions: <Widget>[
          FlatButton.icon(
              onPressed: () {
                Navigator.pushReplacement(
                    context, MaterialPageRoute(builder: (context) => MyApp()));
              },
              icon: Icon(Icons.power_settings_new),
              label: Text('SignOut'))
        ],
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height >= 775.0
            ? MediaQuery.of(context).size.height
            : 775.0,
        decoration: new BoxDecoration(
          gradient: new LinearGradient(
              colors: [
                Theme.Colors.loginGradientStart,
                Theme.Colors.loginGradientEnd
              ],
              begin: const FractionalOffset(0.0, 0.0),
              end: const FractionalOffset(1.0, 1.0),
              stops: [0.0, 1.0],
              tileMode: TileMode.clamp),
        ),
        child: Row(
          children: <Widget>[
            AnimatedContainer(
              padding: EdgeInsets.all(10.0),
              duration: Duration(milliseconds: 500),
              alignment: _alignment,
              child: Container(
                height: 50.0,
                child: Icon(
                  Icons.airplanemode_active,
                  size: 50.0,
                  color: Colors.blueAccent,
                ),
              ),
            ),
            GestureDetector(
                onTap: () {
                  nextpage();
                },
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 25),
                  child: Text(
                    text,
                    style: TextStyle(fontSize: 25, color: Colors.blueGrey),
                  ),
                )),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton.extended(
          backgroundColor: Colors.blueAccent,
          onPressed: () {
            setState(() {
              _alignment = Alignment.center;
              text = "Safely landed, click here";
            });
          },
          icon: Icon(Icons.airplanemode_active),
          label: Text("Take Flight")),
    );
  }
}
