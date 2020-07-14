import 'package:flutter/material.dart';
import 'package:signup_pro/utils/contains.dart';
import 'package:signup_pro/views/1.dart';
import 'package:signup_pro/views/10.dart';
import 'package:signup_pro/views/11.dart';
import 'package:signup_pro/views/12.dart';
import 'package:signup_pro/views/2.dart';
import 'package:signup_pro/views/3.dart';
import 'package:signup_pro/views/4.dart';
import 'package:signup_pro/views/5.dart';
import 'package:signup_pro/views/6.dart';
import 'package:signup_pro/views/7.dart';
import 'package:signup_pro/views/8.dart';
import 'package:signup_pro/views/9.dart';
import 'package:signup_pro/views/lkg.dart';
import 'package:signup_pro/views/ukg.dart';
import '../main.dart';
import '../style/theme.dart' as Theme;
import 'package:flutter/cupertino.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  ScrollController controller = ScrollController();
  bool closeTopContainer = false;
  double topContainer = 0;

  List<Widget> itemsData = [];

  nextpage(index) {
    if (index == 0) {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => UKGClass()));
    }
    if (index == 1) {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => LKGClass()));
    }
    if (index == 2) {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => ClassOne()));
    }
    if (index == 3) {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => ClassTwo()));
    }
    if (index == 4) {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => ClassThree()));
    }
    if (index == 5) {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => ClassFour()));
    }
    if (index == 6) {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => ClassFive()));
    }
    if (index == 7) {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => ClassSix()));
    }
    if (index == 8) {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => ClassSeven()));
    }
    if (index == 9) {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => ClassEight()));
    }
    if (index == 10) {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => ClassNine()));
    }
    if (index == 11) {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => ClassTen()));
    }
    if (index == 12) {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => ClassEleven()));
    }
    if (index == 13) {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => ClassTwelve()));
    }
  }

  void getPostsData() {
    List<dynamic> responseList = CLASS_DATA;
    List<Widget> listItems = [];
    responseList.forEach((post) {
      listItems.add(Container(
          height: 150,
          margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(20.0)),
              color: Colors.white,
              boxShadow: [
                BoxShadow(color: Colors.black.withAlpha(100), blurRadius: 10.0),
              ]),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      post["name"],
                      style: const TextStyle(
                          fontSize: 28, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      post["brand"],
                      style: const TextStyle(fontSize: 25, color: Colors.grey),
                    ),
                  ],
                ),
                Image.asset(
                  "assets/images/${post["image"]}",
                  height: double.infinity,
                )
              ],
            ),
          )));
    });
    setState(() {
      itemsData = listItems;
    });
  }

  @override
  void initState() {
    super.initState();
    getPostsData();
    controller.addListener(() {
      double value = controller.offset / 119;

      setState(() {
        topContainer = value;
        closeTopContainer = controller.offset > 50;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Select Your class"),
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
        child: ListView.builder(
          controller: controller,
          itemCount: itemsData.length,
          physics: BouncingScrollPhysics(),
          itemBuilder: (context, index) {
            double scale = 1.0;
            if (topContainer > 0.5) {
              scale = index + 0.5 - topContainer;
              if (scale < 0) {
                scale = 0;
              } else if (scale > 1) {
                scale = 1;
              }
            }
            return GestureDetector(
              onTap: () => nextpage(index),
              child: Opacity(
                opacity: scale,
                child: Transform(
                  transform: Matrix4.identity()..scale(scale, scale),
                  alignment: Alignment.bottomCenter,
                  child: Align(
                      heightFactor: 0.7,
                      alignment: Alignment.topCenter,
                      child: itemsData[index]),
                ),
              ),
            );
          },
        ),
      ),
      // child: ListView(
      //   scrollDirection: Axis.vertical,
      //   children: <Widget>[
      //     Padding(
      //       padding: const EdgeInsets.all(16.0),
      //       child: Container(
      //           child: new FittedBox(
      //         child: Material(
      //           color: Colors.white,
      //           elevation: 14.0,
      //           borderRadius: BorderRadius.circular(24.0),
      //           shadowColor: Color(0x802196F3),
      //           child: Row(
      //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //             children: <Widget>[
      //               Container(
      //                 child: Padding(
      //                   padding: const EdgeInsets.only(left: 16.0),
      //                   child: Column(
      //                     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      //                     children: <Widget>[
      //                       Padding(
      //                         padding: const EdgeInsets.only(left: 8.0),
      //                         child: Container(
      //                             child: Text(
      //                           "UKG",
      //                           style: TextStyle(
      //                               color: Colors.grey,
      //                               fontSize: 24.0,
      //                               fontWeight: FontWeight.bold),
      //                         )),
      //                       ),
      //                     ],
      //                   ),
      //                 ),
      //               ),
      //               Container(
      //                 width: 250,
      //                 height: 180,
      //                 child: ClipRRect(
      //                   borderRadius: new BorderRadius.circular(24.0),
      //                   child: Image(
      //                     fit: BoxFit.contain,
      //                     alignment: Alignment.topRight,
      //                     image: AssetImage("assets/images/UKG.jpg"),
      //                   ),
      //                 ),
      //               )
      //             ],
      //           ),
      //         ),
      //       )),
      //     ),
      //     Padding(
      //       padding: const EdgeInsets.all(16.0),
      //       child: Container(
      //           child: new FittedBox(
      //         child: Material(
      //           color: Colors.white,
      //           elevation: 14.0,
      //           borderRadius: BorderRadius.circular(24.0),
      //           shadowColor: Color(0x802196F3),
      //           child: Row(
      //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //             children: <Widget>[
      //               Container(
      //                 child: Padding(
      //                   padding: const EdgeInsets.only(left: 16.0),
      //                   child: Column(
      //                     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      //                     children: <Widget>[
      //                       Padding(
      //                         padding: const EdgeInsets.only(left: 8.0),
      //                         child: Container(
      //                             child: Text(
      //                           "LKG",
      //                           style: TextStyle(
      //                               color: Colors.grey,
      //                               fontSize: 24.0,
      //                               fontWeight: FontWeight.bold),
      //                         )),
      //                       ),
      //                     ],
      //                   ),
      //                 ),
      //               ),
      //               Container(
      //                 width: 250,
      //                 height: 180,
      //                 child: ClipRRect(
      //                   borderRadius: new BorderRadius.circular(24.0),
      //                   child: Image(
      //                     fit: BoxFit.contain,
      //                     alignment: Alignment.topRight,
      //                     image: AssetImage("assets/images/LKG.jpg"),
      //                   ),
      //                 ),
      //               )
      //             ],
      //           ),
      //         ),
      //       )),
      //     ),
      //     Padding(
      //       padding: const EdgeInsets.all(16.0),
      //       child: Container(
      //           child: new FittedBox(
      //         child: Material(
      //           color: Colors.white,
      //           elevation: 14.0,
      //           borderRadius: BorderRadius.circular(24.0),
      //           shadowColor: Color(0x802196F3),
      //           child: Row(
      //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //             children: <Widget>[
      //               Container(
      //                 child: Padding(
      //                   padding: const EdgeInsets.only(left: 16.0),
      //                   child: Column(
      //                     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      //                     children: <Widget>[
      //                       Padding(
      //                         padding: const EdgeInsets.only(left: 8.0),
      //                         child: Container(
      //                             child: Text(
      //                           "Class 1",
      //                           style: TextStyle(
      //                               color: Colors.grey,
      //                               fontSize: 24.0,
      //                               fontWeight: FontWeight.bold),
      //                         )),
      //                       ),
      //                     ],
      //                   ),
      //                 ),
      //               ),
      //               Container(
      //                 width: 250,
      //                 height: 180,
      //                 child: ClipRRect(
      //                   borderRadius: new BorderRadius.circular(24.0),
      //                   child: Image(
      //                     fit: BoxFit.contain,
      //                     alignment: Alignment.topRight,
      //                     image: AssetImage("assets/images/1.jpg"),
      //                   ),
      //                 ),
      //               )
      //             ],
      //           ),
      //         ),
      //       )),
      //     ),
      //     Padding(
      //       padding: const EdgeInsets.all(16.0),
      //       child: Container(
      //           child: new FittedBox(
      //         child: Material(
      //           color: Colors.white,
      //           elevation: 14.0,
      //           borderRadius: BorderRadius.circular(24.0),
      //           shadowColor: Color(0x802196F3),
      //           child: Row(
      //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //             children: <Widget>[
      //               Container(
      //                 child: Padding(
      //                   padding: const EdgeInsets.only(left: 16.0),
      //                   child: Column(
      //                     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      //                     children: <Widget>[
      //                       Padding(
      //                         padding: const EdgeInsets.only(left: 8.0),
      //                         child: Container(
      //                             child: Text(
      //                           "Class 2",
      //                           style: TextStyle(
      //                               color: Colors.grey,
      //                               fontSize: 24.0,
      //                               fontWeight: FontWeight.bold),
      //                         )),
      //                       ),
      //                     ],
      //                   ),
      //                 ),
      //               ),
      //               Container(
      //                 width: 250,
      //                 height: 180,
      //                 child: ClipRRect(
      //                   borderRadius: new BorderRadius.circular(24.0),
      //                   child: Image(
      //                     fit: BoxFit.contain,
      //                     alignment: Alignment.topRight,
      //                     image: AssetImage("assets/images/2.jpg"),
      //                   ),
      //                 ),
      //               )
      //             ],
      //           ),
      //         ),
      //       )),
      //     ),
      //     Padding(
      //       padding: const EdgeInsets.all(16.0),
      //       child: Container(
      //         child: new FittedBox(
      //           child: Material(
      //             color: Colors.white,
      //             elevation: 14.0,
      //             borderRadius: BorderRadius.circular(24.0),
      //             shadowColor: Color(0x802196F3),
      //             child: Row(
      //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //               children: <Widget>[
      //                 Container(
      //                   child: Padding(
      //                     padding: const EdgeInsets.only(left: 16.0),
      //                     child: Column(
      //                       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      //                       children: <Widget>[
      //                         Padding(
      //                           padding: const EdgeInsets.only(left: 8.0),
      //                           child: Container(
      //                               child: Text(
      //                             "Class 3",
      //                             style: TextStyle(
      //                                 color: Colors.grey,
      //                                 fontSize: 24.0,
      //                                 fontWeight: FontWeight.bold),
      //                           )),
      //                         ),
      //                       ],
      //                     ),
      //                   ),
      //                 ),
      //                 Container(
      //                   width: 250,
      //                   height: 180,
      //                   child: ClipRRect(
      //                     borderRadius: new BorderRadius.circular(24.0),
      //                     child: Image(
      //                       fit: BoxFit.contain,
      //                       alignment: Alignment.topRight,
      //                       image: AssetImage("assets/images/3.jpg"),
      //                     ),
      //                   ),
      //                 )
      //               ],
      //             ),
      //           ),
      //         ),
      //       ),
      //     ),
      //     Padding(
      //       padding: const EdgeInsets.all(16.0),
      //       child: Container(
      //         child: new FittedBox(
      //           child: Material(
      //             color: Colors.white,
      //             elevation: 14.0,
      //             borderRadius: BorderRadius.circular(24.0),
      //             shadowColor: Color(0x802196F3),
      //             child: Row(
      //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //               children: <Widget>[
      //                 Container(
      //                   child: Padding(
      //                     padding: const EdgeInsets.only(left: 16.0),
      //                     child: Column(
      //                       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      //                       children: <Widget>[
      //                         Padding(
      //                           padding: const EdgeInsets.only(left: 8.0),
      //                           child: Container(
      //                               child: Text(
      //                             "Class 4",
      //                             style: TextStyle(
      //                                 color: Colors.grey,
      //                                 fontSize: 24.0,
      //                                 fontWeight: FontWeight.bold),
      //                           )),
      //                         ),
      //                       ],
      //                     ),
      //                   ),
      //                 ),
      //                 Container(
      //                   width: 250,
      //                   height: 180,
      //                   child: ClipRRect(
      //                     borderRadius: new BorderRadius.circular(24.0),
      //                     child: Image(
      //                       fit: BoxFit.contain,
      //                       alignment: Alignment.topRight,
      //                       image: AssetImage("assets/images/4.png"),
      //                     ),
      //                   ),
      //                 )
      //               ],
      //             ),
      //           ),
      //         ),
      //       ),
      //     ),
      //     Padding(
      //       padding: const EdgeInsets.all(16.0),
      //       child: Container(
      //         child: new FittedBox(
      //           child: Material(
      //             color: Colors.white,
      //             elevation: 14.0,
      //             borderRadius: BorderRadius.circular(24.0),
      //             shadowColor: Color(0x802196F3),
      //             child: Row(
      //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //               children: <Widget>[
      //                 Container(
      //                   child: Padding(
      //                     padding: const EdgeInsets.only(left: 16.0),
      //                     child: Column(
      //                       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      //                       children: <Widget>[
      //                         Padding(
      //                           padding: const EdgeInsets.only(left: 8.0),
      //                           child: Container(
      //                               child: Text(
      //                             "Class 5",
      //                             style: TextStyle(
      //                                 color: Colors.grey,
      //                                 fontSize: 24.0,
      //                                 fontWeight: FontWeight.bold),
      //                           )),
      //                         ),
      //                       ],
      //                     ),
      //                   ),
      //                 ),
      //                 Container(
      //                   width: 250,
      //                   height: 180,
      //                   child: ClipRRect(
      //                     borderRadius: new BorderRadius.circular(24.0),
      //                     child: Image(
      //                       fit: BoxFit.contain,
      //                       alignment: Alignment.topRight,
      //                       image: AssetImage("assets/images/5.jpg"),
      //                     ),
      //                   ),
      //                 )
      //               ],
      //             ),
      //           ),
      //         ),
      //       ),
      //     ),
      //     Padding(
      //       padding: const EdgeInsets.all(16.0),
      //       child: Container(
      //         child: new FittedBox(
      //           child: Material(
      //             color: Colors.white,
      //             elevation: 14.0,
      //             borderRadius: BorderRadius.circular(24.0),
      //             shadowColor: Color(0x802196F3),
      //             child: Row(
      //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //               children: <Widget>[
      //                 Container(
      //                   child: Padding(
      //                     padding: const EdgeInsets.only(left: 16.0),
      //                     child: Column(
      //                       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      //                       children: <Widget>[
      //                         Padding(
      //                           padding: const EdgeInsets.only(left: 8.0),
      //                           child: Container(
      //                               child: Text(
      //                             "Class 6",
      //                             style: TextStyle(
      //                                 color: Colors.grey,
      //                                 fontSize: 24.0,
      //                                 fontWeight: FontWeight.bold),
      //                           )),
      //                         ),
      //                       ],
      //                     ),
      //                   ),
      //                 ),
      //                 Container(
      //                   width: 250,
      //                   height: 180,
      //                   child: ClipRRect(
      //                     borderRadius: new BorderRadius.circular(24.0),
      //                     child: Image(
      //                       fit: BoxFit.contain,
      //                       alignment: Alignment.topRight,
      //                       image: AssetImage("assets/images/6.jpg"),
      //                     ),
      //                   ),
      //                 )
      //               ],
      //             ),
      //           ),
      //         ),
      //       ),
      //     ),
      //     Padding(
      //       padding: const EdgeInsets.all(16.0),
      //       child: Container(
      //         child: new FittedBox(
      //           child: Material(
      //             color: Colors.white,
      //             elevation: 14.0,
      //             borderRadius: BorderRadius.circular(24.0),
      //             shadowColor: Color(0x802196F3),
      //             child: Row(
      //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //               children: <Widget>[
      //                 Container(
      //                   child: Padding(
      //                     padding: const EdgeInsets.only(left: 16.0),
      //                     child: Column(
      //                       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      //                       children: <Widget>[
      //                         Padding(
      //                           padding: const EdgeInsets.only(left: 8.0),
      //                           child: Container(
      //                               child: Text(
      //                             "Class 7",
      //                             style: TextStyle(
      //                                 color: Colors.grey,
      //                                 fontSize: 24.0,
      //                                 fontWeight: FontWeight.bold),
      //                           )),
      //                         ),
      //                       ],
      //                     ),
      //                   ),
      //                 ),
      //                 Container(
      //                   width: 250,
      //                   height: 180,
      //                   child: ClipRRect(
      //                     borderRadius: new BorderRadius.circular(24.0),
      //                     child: Image(
      //                       fit: BoxFit.contain,
      //                       alignment: Alignment.topRight,
      //                       image: AssetImage("assets/images/7.jpg"),
      //                     ),
      //                   ),
      //                 )
      //               ],
      //             ),
      //           ),
      //         ),
      //       ),
      //     ),
      //     Padding(
      //       padding: const EdgeInsets.all(16.0),
      //       child: Container(
      //         child: new FittedBox(
      //           child: Material(
      //             color: Colors.white,
      //             elevation: 14.0,
      //             borderRadius: BorderRadius.circular(24.0),
      //             shadowColor: Color(0x802196F3),
      //             child: Row(
      //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //               children: <Widget>[
      //                 Container(
      //                   child: Padding(
      //                     padding: const EdgeInsets.only(left: 16.0),
      //                     child: Column(
      //                       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      //                       children: <Widget>[
      //                         Padding(
      //                           padding: const EdgeInsets.only(left: 8.0),
      //                           child: Container(
      //                               child: Text(
      //                             "Class 8",
      //                             style: TextStyle(
      //                                 color: Colors.grey,
      //                                 fontSize: 24.0,
      //                                 fontWeight: FontWeight.bold),
      //                           )),
      //                         ),
      //                       ],
      //                     ),
      //                   ),
      //                 ),
      //                 Container(
      //                   width: 250,
      //                   height: 180,
      //                   child: ClipRRect(
      //                     borderRadius: new BorderRadius.circular(24.0),
      //                     child: Image(
      //                       fit: BoxFit.contain,
      //                       alignment: Alignment.topRight,
      //                       image: AssetImage("assets/images/8.jpg"),
      //                     ),
      //                   ),
      //                 )
      //               ],
      //             ),
      //           ),
      //         ),
      //       ),
      //     ),
      //     Padding(
      //       padding: const EdgeInsets.all(16.0),
      //       child: Container(
      //         child: new FittedBox(
      //           child: Material(
      //             color: Colors.white,
      //             elevation: 14.0,
      //             borderRadius: BorderRadius.circular(24.0),
      //             shadowColor: Color(0x802196F3),
      //             child: Row(
      //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //               children: <Widget>[
      //                 Container(
      //                   child: Padding(
      //                     padding: const EdgeInsets.only(left: 16.0),
      //                     child: Column(
      //                       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      //                       children: <Widget>[
      //                         Padding(
      //                           padding: const EdgeInsets.only(left: 8.0),
      //                           child: Container(
      //                               child: Text(
      //                             "Class 9",
      //                             style: TextStyle(
      //                                 color: Colors.grey,
      //                                 fontSize: 24.0,
      //                                 fontWeight: FontWeight.bold),
      //                           )),
      //                         ),
      //                       ],
      //                     ),
      //                   ),
      //                 ),
      //                 Container(
      //                   width: 250,
      //                   height: 180,
      //                   child: ClipRRect(
      //                     borderRadius: new BorderRadius.circular(24.0),
      //                     child: Image(
      //                       fit: BoxFit.contain,
      //                       alignment: Alignment.topRight,
      //                       image: AssetImage("assets/images/9.jpg"),
      //                     ),
      //                   ),
      //                 )
      //               ],
      //             ),
      //           ),
      //         ),
      //       ),
      //     ),
      //     Padding(
      //       padding: const EdgeInsets.all(16.0),
      //       child: Container(
      //         child: new FittedBox(
      //           child: Material(
      //             color: Colors.white,
      //             elevation: 14.0,
      //             borderRadius: BorderRadius.circular(24.0),
      //             shadowColor: Color(0x802196F3),
      //             child: Row(
      //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //               children: <Widget>[
      //                 Container(
      //                   child: Padding(
      //                     padding: const EdgeInsets.only(left: 16.0),
      //                     child: Column(
      //                       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      //                       children: <Widget>[
      //                         Padding(
      //                           padding: const EdgeInsets.only(left: 8.0),
      //                           child: Container(
      //                               child: Text(
      //                             "Class 10",
      //                             style: TextStyle(
      //                                 color: Colors.grey,
      //                                 fontSize: 24.0,
      //                                 fontWeight: FontWeight.bold),
      //                           )),
      //                         ),
      //                       ],
      //                     ),
      //                   ),
      //                 ),
      //                 Container(
      //                   width: 250,
      //                   height: 180,
      //                   child: ClipRRect(
      //                     borderRadius: new BorderRadius.circular(24.0),
      //                     child: Image(
      //                       fit: BoxFit.contain,
      //                       alignment: Alignment.topRight,
      //                       image: AssetImage("assets/images/10.jpg"),
      //                     ),
      //                   ),
      //                 )
      //               ],
      //             ),
      //           ),
      //         ),
      //       ),
      //     ),
      //     Padding(
      //       padding: const EdgeInsets.all(16.0),
      //       child: Container(
      //         child: new FittedBox(
      //           child: Material(
      //             color: Colors.white,
      //             elevation: 14.0,
      //             borderRadius: BorderRadius.circular(24.0),
      //             shadowColor: Color(0x802196F3),
      //             child: Row(
      //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //               children: <Widget>[
      //                 Container(
      //                   child: Padding(
      //                     padding: const EdgeInsets.only(left: 16.0),
      //                     child: Column(
      //                       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      //                       children: <Widget>[
      //                         Padding(
      //                           padding: const EdgeInsets.only(left: 8.0),
      //                           child: Container(
      //                               child: Text(
      //                             "Class 11",
      //                             style: TextStyle(
      //                                 color: Colors.grey,
      //                                 fontSize: 24.0,
      //                                 fontWeight: FontWeight.bold),
      //                           )),
      //                         ),
      //                       ],
      //                     ),
      //                   ),
      //                 ),
      //                 Container(
      //                   width: 250,
      //                   height: 180,
      //                   child: ClipRRect(
      //                     borderRadius: new BorderRadius.circular(24.0),
      //                     child: Image(
      //                       fit: BoxFit.contain,
      //                       alignment: Alignment.topRight,
      //                       image: AssetImage("assets/images/11.PNG"),
      //                     ),
      //                   ),
      //                 )
      //               ],
      //             ),
      //           ),
      //         ),
      //       ),
      //     ),
      //     Padding(
      //       padding: const EdgeInsets.all(16.0),
      //       child: Container(
      //         child: new FittedBox(
      //           child: Material(
      //             color: Colors.white,
      //             elevation: 14.0,
      //             borderRadius: BorderRadius.circular(24.0),
      //             shadowColor: Color(0x802196F3),
      //             child: Row(
      //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //               children: <Widget>[
      //                 Container(
      //                   child: Padding(
      //                     padding: const EdgeInsets.only(left: 16.0),
      //                     child: Column(
      //                       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      //                       children: <Widget>[
      //                         Padding(
      //                           padding: const EdgeInsets.only(left: 8.0),
      //                           child: Container(
      //                               child: Text(
      //                             "Class 12",
      //                             style: TextStyle(
      //                                 color: Colors.grey,
      //                                 fontSize: 24.0,
      //                                 fontWeight: FontWeight.bold),
      //                           )),
      //                         ),
      //                       ],
      //                     ),
      //                   ),
      //                 ),
      //                 Container(
      //                   width: 250,
      //                   height: 180,
      //                   child: ClipRRect(
      //                     borderRadius: new BorderRadius.circular(24.0),
      //                     child: Image(
      //                       fit: BoxFit.contain,
      //                       alignment: Alignment.topRight,
      //                       image: AssetImage("assets/images/12.PNG"),
      //                     ),
      //                   ),
      //                 )
      //               ],
      //             ),
      //           ),
      //         ),
      //       ),
      //     ),
      //   ],
      // ),
    );
  }
}
