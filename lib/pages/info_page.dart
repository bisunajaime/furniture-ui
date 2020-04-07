import 'package:flutter/material.dart';
import 'package:flutter_ui_four/constants/constants.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class InfoPage extends StatefulWidget {
  final String tag;
  final String title;
  final String address;
  final String price;

  InfoPage({
    this.tag,
    this.title,
    this.address,
    this.price,
  });

  @override
  _InfoPageState createState() => _InfoPageState();
}

class _InfoPageState extends State<InfoPage>
    with SingleTickerProviderStateMixin {
  AnimationController controller;

  Animation<double> titleAnim;
  Animation<double> addressAnim;
  Animation<double> contactAnim;

  Animation<double> priceAnim, availAnim, iconOneAnim, iconTwoAnim;

  Animation<Offset> furnitureAnim, contentAnim;

  @override
  void initState() {
    super.initState();

    controller = new AnimationController(
        vsync: this, duration: Duration(milliseconds: 1500));

    titleAnim = new Tween<double>(
      begin: 0,
      end: 1,
    ).animate(CurvedAnimation(
        parent: controller,
        curve: Interval(
          0.0,
          1.0,
          curve: Curves.fastOutSlowIn,
        )));
    addressAnim = new Tween<double>(
      begin: 0,
      end: 1,
    ).animate(CurvedAnimation(
        parent: controller,
        curve: Interval(
          0.1,
          1.0,
          curve: Curves.fastOutSlowIn,
        )));
    contactAnim = new Tween<double>(
      begin: 0,
      end: 1,
    ).animate(CurvedAnimation(
        parent: controller,
        curve: Interval(
          0.2,
          1.0,
          curve: Curves.fastOutSlowIn,
        )));
    priceAnim = new Tween<double>(
      begin: 0,
      end: 1,
    ).animate(CurvedAnimation(
        parent: controller,
        curve: Interval(
          0.15,
          1.0,
          curve: Curves.elasticOut,
        )));
    availAnim = new Tween<double>(
      begin: 0,
      end: 1,
    ).animate(CurvedAnimation(
        parent: controller,
        curve: Interval(
          0.25,
          1.0,
          curve: Curves.elasticOut,
        )));
    iconOneAnim = new Tween<double>(
      begin: 0,
      end: 1,
    ).animate(CurvedAnimation(
        parent: controller,
        curve: Interval(
          0.35,
          1.0,
          curve: Curves.elasticOut,
        )));
    iconTwoAnim = new Tween<double>(
      begin: 0,
      end: 1,
    ).animate(CurvedAnimation(
        parent: controller,
        curve: Interval(
          0.35,
          1.0,
          curve: Curves.elasticOut,
        )));

    furnitureAnim = new Tween<Offset>(
      begin: Offset(-2, 0),
      end: Offset.zero,
    ).animate(CurvedAnimation(
        parent: controller,
        curve: Interval(
          0.2,
          1.0,
          curve: Curves.elasticOut,
        )));
    contentAnim = new Tween<Offset>(
      begin: Offset(2, 0),
      end: Offset.zero,
    ).animate(CurvedAnimation(
        parent: controller,
        curve: Interval(
          0.2,
          1.0,
          curve: Curves.fastLinearToSlowEaseIn,
        )));

    controller.forward();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Stack(
              children: <Widget>[
                Hero(
                  tag: widget.tag,
                  child: Container(
                    height: 300,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage('$pathToImg${widget.tag}.jpg'),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: 30,
                  left: 10,
                  right: 10,
                  child: Row(
                    children: <Widget>[
                      IconButton(
                        icon: Icon(
                          FontAwesomeIcons.arrowLeft,
                          color: Colors.white,
                        ),
                        onPressed: () async {
                          controller.reverse(from: 2.0);
                          await Future.delayed(Duration(milliseconds: 1500));
                          Navigator.pop(context);
                        },
                      )
                    ],
                  ),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      ScaleTransition(
                        scale: titleAnim,
                        alignment: Alignment.centerLeft,
                        child: Text(
                          widget.title,
                          style: TextStyle(
                            fontFamily: pMed,
                            fontSize: 36,
                          ),
                        ),
                      ),
                      ScaleTransition(
                        scale: addressAnim,
                        alignment: Alignment.centerLeft,
                        child: Text(
                          widget.address,
                          style: TextStyle(
                            fontFamily: pMed,
                            color: Colors.grey[700],
                            fontSize: 14,
                          ),
                        ),
                      ),
                      ScaleTransition(
                        scale: contactAnim,
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Jason Ramos',
                          style: TextStyle(
                            fontFamily: pBold,
                            fontSize: 14,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      ScaleTransition(
                        scale: priceAnim,
                        child: Text(
                          widget.price,
                          style: TextStyle(
                            fontFamily: pBold,
                            fontSize: 18,
                            color: priceColor,
                          ),
                        ),
                      ),
                      ScaleTransition(
                        scale: availAnim,
                        child: Text(
                          'Available',
                          style: TextStyle(
                            color: priceColor,
                            fontSize: 12,
                            fontFamily: pReg,
                          ),
                        ),
                      ),
                      Row(
                        children: <Widget>[
                          ScaleTransition(
                            scale: iconOneAnim,
                            child: Icon(
                              FontAwesomeIcons.envelopeOpenText,
                              size: 25,
                              color: priceColor,
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          ScaleTransition(
                            scale: iconTwoAnim,
                            child: Icon(
                              FontAwesomeIcons.phoneAlt,
                              size: 25,
                              color: priceColor,
                            ),
                          ),
                        ],
                      )
                    ],
                  )
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            SlideTransition(
              position: furnitureAnim,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Text(
                  'Furniture',
                  style: TextStyle(
                    fontFamily: pSBold,
                    fontSize: 18,
                  ),
                ),
              ),
            ),
            Container(
              height: 400,
              width: double.infinity,
              child: SlideTransition(
                position: contentAnim,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  physics: BouncingScrollPhysics(),
                  children: <Widget>[
                    FurnitureWidget(
                      img: 'couch-1',
                      address: '088 Alisha Hill Apt. 345',
                      price: '\$500',
                      title: 'Couch',
                    ),
                    FurnitureWidget(
                      img: 'chair-1',
                      address: '088 Alisha Hill Apt. 345',
                      price: '\$1000',
                      title: 'Chair',
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    );
  }
}

class FurnitureWidget extends StatelessWidget {
  final String img, title, address, price;

  FurnitureWidget({this.img, this.title, this.address, this.price});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: 370,
      margin: EdgeInsets.symmetric(
        horizontal: 10,
        vertical: 20,
      ),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              blurRadius: 15,
              color: Colors.black12,
            )
          ]),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Expanded(
            flex: 2,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10),
                  topRight: Radius.circular(10),
                ),
                image: DecorationImage(
                  image: AssetImage('$pathToImg/$img.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    title,
                    style: TextStyle(
                      fontFamily: pSBold,
                      fontSize: 24,
                    ),
                  ),
                  Text(
                    address,
                    style: TextStyle(
                      fontFamily: pReg,
                      fontSize: 14,
                      color: Colors.grey[700],
                    ),
                  ),
                  Text(
                    price,
                    style: TextStyle(
                      fontFamily: pBold,
                      fontSize: 24,
                      color: priceColor,
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
