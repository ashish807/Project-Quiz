import 'package:flutter/material.dart';
import 'package:signup_pro/utils/subjects6_8.dart';
import 'package:signup_pro/views/home.dart';

import '../style/theme.dart' as Theme;

class ClassSix extends StatefulWidget {
  @override
  _ClassSixState createState() => _ClassSixState();
}

class _ClassSixState extends State<ClassSix> {
  ScrollController controller = ScrollController();
  bool closeTopContainer = false;
  double topContainer = 0;
  List<Widget> itemsData = [];

  void getPostsData() {
    List<dynamic> responseList = SUBJECT_6_8;
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
                      style: const TextStyle(
                          fontSize: 28, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      post["Play"],
                      style: const TextStyle(fontSize: 15, color: Colors.grey),
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
        automaticallyImplyLeading: true,
        leading: IconButton(
            icon: Icon(Icons.arrow_back_ios),
            onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Home()));
            }),
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
              onTap: () => null,
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
    );
  }
}
