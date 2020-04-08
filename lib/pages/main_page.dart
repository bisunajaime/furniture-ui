import 'package:flutter/material.dart';
import 'package:flutter_ui_four/constants/constants.dart';
import 'package:flutter_ui_four/widgets/category_widget.dart';
import 'package:flutter_ui_four/widgets/featured_widget.dart';
import 'package:flutter_ui_four/widgets/furniture_icons.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'info_page.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage>
    with SingleTickerProviderStateMixin {
  AnimationController controller;
  Animation<Offset> greetingScale;
  Animation<double> bellScale;
  Animation<double> searchScale;

  Animation<Offset> subGreetingSlide;
  Animation<Offset> furnitureSlide;
  Animation<Offset> furnitureIconSlide;
  Animation<Offset> labelSlide;
  Animation<Offset> labelIconSlide;
  Animation<Offset> categorySlide;
  Animation<Offset> featuredSlide;
  Animation<Offset> bottomSlide;

  @override
  void initState() {
    super.initState();

    controller = new AnimationController(
        vsync: this, duration: Duration(milliseconds: 2000));

    greetingScale = new Tween<Offset>(
      begin: Offset(-1, 0),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: controller,
      curve: Curves.fastOutSlowIn,
    ));

    bellScale = new Tween<double>(
      begin: 0,
      end: 1,
    ).animate(CurvedAnimation(
      parent: controller,
      curve: Curves.bounceOut,
    ));
    searchScale = new Tween<double>(
      begin: 0,
      end: 1,
    ).animate(CurvedAnimation(parent: controller, curve: Curves.elasticOut));

    subGreetingSlide = new Tween<Offset>(
      begin: Offset(-1, 0),
      end: Offset.zero,
    ).animate(
      CurvedAnimation(
        parent: controller,
        curve: Interval(0.15, 1.0, curve: Curves.ease),
      ),
    );
    furnitureSlide = new Tween<Offset>(
      begin: Offset(-1, 0),
      end: Offset.zero,
    ).animate(
      CurvedAnimation(
        parent: controller,
        curve: Interval(0.2, 1.0, curve: Curves.ease),
      ),
    );
    furnitureIconSlide = new Tween<Offset>(
      begin: Offset(1, 0),
      end: Offset.zero,
    ).animate(
      CurvedAnimation(
        parent: controller,
        curve: Interval(0.2, 1.0, curve: Curves.fastOutSlowIn),
      ),
    );
    labelSlide = new Tween<Offset>(
      begin: Offset(-2, 0),
      end: Offset.zero,
    ).animate(
      CurvedAnimation(
        parent: controller,
        curve: Interval(0.2, 1.0, curve: Curves.fastOutSlowIn),
      ),
    );
    labelIconSlide = new Tween<Offset>(
      begin: Offset(2, 0),
      end: Offset.zero,
    ).animate(
      CurvedAnimation(
        parent: controller,
        curve: Interval(0.25, 1.0, curve: Curves.fastOutSlowIn),
      ),
    );
    categorySlide = new Tween<Offset>(
      begin: Offset(2, 0),
      end: Offset.zero,
    ).animate(
      CurvedAnimation(
        parent: controller,
        curve: Interval(0.35, 1.0, curve: Curves.fastOutSlowIn),
      ),
    );
    featuredSlide = new Tween<Offset>(
      begin: Offset(2, 0),
      end: Offset.zero,
    ).animate(
      CurvedAnimation(
        parent: controller,
        curve: Interval(0.45, 1.0, curve: Curves.fastOutSlowIn),
      ),
    );
    bottomSlide = new Tween<Offset>(
      begin: Offset(-2, 0),
      end: Offset.zero,
    ).animate(
      CurvedAnimation(
        parent: controller,
        curve: Interval(0.5, 1.0, curve: Curves.ease),
      ),
    );

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
      bottomNavigationBar:
          SlideTransition(position: bottomSlide, child: buildBottombar()),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Stack(
          children: <Widget>[
            Column(
              children: <Widget>[
                Container(
                  height: 250,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        rectGradeintOne,
                        rectGradientTwo,
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 15, vertical: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            SlideTransition(
                              position: greetingScale,
                              child: Text(
                                'Hello, John',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: pBold,
                                  fontSize: 24,
                                ),
                              ),
                            ),
                            SlideTransition(
                              position: subGreetingSlide,
                              child: Text(
                                'What are you looking for?',
                                style: TextStyle(
                                  fontFamily: pSBold,
                                  fontSize: 14,
                                  color: Colors.white70,
                                ),
                              ),
                            )
                          ],
                        ),
                        ScaleTransition(
                          scale: bellScale,
                          child: Container(
                            height: 50,
                            width: 50,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              boxShadow: [
                                BoxShadow(
                                  blurRadius: 4,
                                  offset: Offset(3, 3),
                                  color: Colors.black,
                                )
                              ],
                              gradient: LinearGradient(
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                                colors: [
                                  bellGradientOne,
                                  bellGradientTwo,
                                ],
                              ),
                            ),
                            child: Icon(
                              FontAwesomeIcons.solidBell,
                              color: Colors.white,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  ScaleTransition(
                    scale: searchScale,
                    child: Container(
                      height: 50,
                      margin: EdgeInsets.symmetric(horizontal: 15),
                      decoration: BoxDecoration(
                        color: searchBarColor,
                        borderRadius: BorderRadius.all(
                          Radius.circular(3),
                        ),
                      ),
                      child: Row(
                        children: <Widget>[
                          SizedBox(
                            width: 15,
                          ),
                          Icon(
                            FontAwesomeIcons.search,
                            color: Colors.black,
                          ),
                          SizedBox(
                            width: 15,
                          ),
                          Text(
                            'Search furniture here',
                            style: TextStyle(
                              fontFamily: pMed,
                              color: Colors.grey[700],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  SlideTransition(
                    position: furnitureSlide,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 15, vertical: 5),
                      child: Text(
                        'Furniture',
                        style: TextStyle(
                          fontFamily: pMed,
                          color: Colors.white,
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ),
                  SlideTransition(
                    position: furnitureIconSlide,
                    child: Container(
                      height: 80,
                      width: double.infinity,
                      child: ListView(
                        physics: BouncingScrollPhysics(),
                        scrollDirection: Axis.horizontal,
                        children: <Widget>[
                          FurnitureIcon(
                            icon: Icon(
                              FontAwesomeIcons.chair,
                              size: 20,
                            ),
                            label: 'Chair',
                          ),
                          FurnitureIcon(
                            icon: Icon(
                              FontAwesomeIcons.couch,
                              size: 20,
                            ),
                            label: 'Couch',
                          ),
                          FurnitureIcon(
                            icon: Icon(
                              FontAwesomeIcons.doorOpen,
                              size: 20,
                            ),
                            label: 'Door',
                          ),
                          FurnitureIcon(
                            icon: Icon(
                              FontAwesomeIcons.fireAlt,
                              size: 20,
                            ),
                            label: 'Fireplace',
                          ),
                          FurnitureIcon(
                            icon: Icon(
                              FontAwesomeIcons.water,
                              size: 20,
                            ),
                            label: 'Pool',
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        SlideTransition(
                          position: labelSlide,
                          child: Text(
                            'Categories',
                            style: TextStyle(
                              fontFamily: pMed,
                              fontSize: 18,
                            ),
                          ),
                        ),
                        SlideTransition(
                          position: labelIconSlide,
                          child: Icon(
                            FontAwesomeIcons.arrowRight,
                            size: 20,
                          ),
                        )
                      ],
                    ),
                  ),
                  SlideTransition(
                    position: categorySlide,
                    child: Container(
                      height: 210,
                      width: double.infinity,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        physics: BouncingScrollPhysics(),
                        children: <Widget>[
                          CategoryWidget(
                            img: 'furniture-1',
                            title: 'Family House',
                            address: '088 Alisha Hill Apt. 345',
                            price: '\$800',
                          ),
                          CategoryWidget(
                            img: 'furniture-2',
                            title: 'Pent House',
                            address: '123 Dawn Hill Apt. 456',
                            price: '\$500',
                          ),
                          CategoryWidget(
                            img: 'furniture-3',
                            title: 'Cabin',
                            address: '908 Desert Apt. 345',
                            price: '\$600',
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        SlideTransition(
                          position: labelSlide,
                          child: Text(
                            'Featured Product Packs',
                            style: TextStyle(
                              fontFamily: pMed,
                              fontSize: 18,
                            ),
                          ),
                        ),
                        SlideTransition(
                          position: labelIconSlide,
                          child: Icon(
                            FontAwesomeIcons.arrowRight,
                            size: 20,
                          ),
                        )
                      ],
                    ),
                  ),
                  SlideTransition(
                    position: featuredSlide,
                    child: Container(
                      height: 250,
                      width: double.infinity,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        physics: BouncingScrollPhysics(),
                        children: <Widget>[
                          FeaturedWidget(
                            img: 'furniture-4',
                            title: 'The House',
                            address: '088 New Ave.',
                            price: '\$1000',
                          ),
                          FeaturedWidget(
                            img: 'furniture-5',
                            title: 'Family House',
                            address: '088 Alisha Hill Apt. 345',
                            price: '\$1000',
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  BottomNavigationBar buildBottombar() {
    return BottomNavigationBar(
      backgroundColor: bottomBarColor,
      type: BottomNavigationBarType.fixed,
      items: [
        BottomNavigationBarItem(
          icon: Icon(
            FontAwesomeIcons.home,
            color: Colors.white,
          ),
          title: Text(
            'Home',
            style: TextStyle(
              fontFamily: pReg,
              color: Colors.white,
              fontSize: 12,
            ),
          ),
        ),
        BottomNavigationBarItem(
          icon: Icon(
            FontAwesomeIcons.shoppingCart,
            color: bottomIconInactive,
          ),
          title: Text(
            'Cart',
            style: TextStyle(
              fontFamily: pReg,
              color: Colors.white,
              fontSize: 12,
            ),
          ),
        ),
        BottomNavigationBarItem(
          icon: Icon(
            FontAwesomeIcons.envelopeOpenText,
            color: bottomIconInactive,
          ),
          title: Text(
            'Messages',
            style: TextStyle(
              fontFamily: pReg,
              color: Colors.white,
              fontSize: 12,
            ),
          ),
        ),
        BottomNavigationBarItem(
          icon: Icon(
            FontAwesomeIcons.cog,
            color: bottomIconInactive,
          ),
          title: Text(
            'Settings',
            style: TextStyle(
              fontFamily: pReg,
              color: Colors.white,
              fontSize: 12,
            ),
          ),
        ),
        BottomNavigationBarItem(
          icon: Icon(
            FontAwesomeIcons.signOutAlt,
            color: Colors.redAccent[100],
          ),
          title: Text(
            'Signout',
            style: TextStyle(
              fontFamily: pReg,
              color: Colors.white,
              fontSize: 12,
            ),
          ),
        ),
      ],
    );
  }
}
