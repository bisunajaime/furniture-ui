import 'package:flutter/material.dart';
import 'package:flutter_ui_four/constants/constants.dart';
import 'package:flutter_ui_four/pages/info_page.dart';

class FeaturedWidget extends StatefulWidget {
  final String img, title, address, price;

  FeaturedWidget({this.img, this.title, this.address, this.price});

  @override
  _FeaturedWidgetState createState() => _FeaturedWidgetState();
}

class _FeaturedWidgetState extends State<FeaturedWidget>
    with SingleTickerProviderStateMixin {
  AnimationController controller;
  Animation<double> bounceTap;

  @override
  void initState() {
    super.initState();

    controller = new AnimationController(
        vsync: this, duration: Duration(milliseconds: 1000));

    bounceTap = new Tween<double>(
      begin: 1,
      end: 0.95,
    ).animate(CurvedAnimation(
      parent: controller,
      curve: Curves.elasticOut,
    ));
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (TapDownDetails tdd) {
        controller.forward();
      },
      onTapUp: (TapUpDetails tud) {
        controller.reverse();
      },
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => InfoPage(
            tag: widget.img,
            address: widget.address,
            price: widget.price,
            title: widget.title,
          ),
        ),
      ),
      onTapCancel: () {
        controller.reverse();
      },
      child: ScaleTransition(
        scale: bounceTap,
        child: Container(
          height: double.infinity,
          width: 260,
          margin: EdgeInsets.symmetric(
            horizontal: 10,
            vertical: 15,
          ),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(5)),
            boxShadow: [
              BoxShadow(
                blurRadius: 15,
                color: Colors.black26,
              )
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Expanded(
                flex: 2,
                child: Hero(
                  tag: widget.img,
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(5),
                        topRight: Radius.circular(5),
                      ),
                      image: DecorationImage(
                        image: AssetImage('$pathToImg/${widget.img}.jpg'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 5,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        widget.title,
                        style: TextStyle(
                          fontFamily: pMed,
                          fontSize: 18,
                        ),
                      ),
                      Text(
                        widget.address,
                        style: TextStyle(
                          fontFamily: pReg,
                          fontSize: 9,
                          color: Colors.grey[600],
                        ),
                      ),
                      Text(
                        widget.price,
                        style: TextStyle(
                          fontFamily: pBold,
                          fontSize: 15,
                          color: priceColor,
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
