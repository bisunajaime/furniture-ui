import 'package:flutter/material.dart';
import 'package:flutter_ui_four/constants/constants.dart';
import 'package:flutter_ui_four/pages/main_page.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  AnimationController controller;
  Animation<double> backgroundAnim;
  Animation<double> titleAnim;
  Animation<double> subTitleAnim;
  Animation<double> buttonAnim;

  @override
  void initState() {
    super.initState();
    controller = new AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 1500),
    );

    backgroundAnim = new Tween<double>(
      begin: 3.0,
      end: 1,
    ).animate(
      CurvedAnimation(
        parent: controller,
        curve: Curves.fastOutSlowIn,
      ),
    );

    titleAnim = new Tween<double>(
      begin: 0,
      end: 1,
    ).animate(
      CurvedAnimation(
        parent: controller,
        curve: Curves.fastOutSlowIn,
      ),
    );

    subTitleAnim = new Tween<double>(
      begin: 3,
      end: 1,
    ).animate(
      CurvedAnimation(
        parent: controller,
        curve: Curves.fastOutSlowIn,
      ),
    );

    buttonAnim = new Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(
        parent: controller,
        curve: Curves.elasticOut,
      ),
    );

    controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          ScaleTransition(
            scale: backgroundAnim,
            child: Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: Colors.indigo[900],
                image: DecorationImage(
                  image: AssetImage('$pathToImg/bg.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                ScaleTransition(
                  scale: titleAnim,
                  child: Image(
                    image: AssetImage('$pathToImg/Title.png'),
                  ),
                ),
                ScaleTransition(
                  scale: subTitleAnim,
                  child: Text(
                    'Find the best place to live',
                    style: TextStyle(
                      fontFamily: pSBold,
                      fontSize: 18,
                      color: Colors.grey[300],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 100,
            left: 50,
            right: 50,
            child: ScaleTransition(
              scale: buttonAnim,
              child: MaterialButton(
                onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MainPage()),
                ),
                color: Colors.amber[900],
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50),
                ),
                padding: EdgeInsets.symmetric(vertical: 15),
                child: Text(
                  'Start here',
                  style: TextStyle(
                    fontFamily: pMed,
                    color: Colors.white,
                    fontSize: 18,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
