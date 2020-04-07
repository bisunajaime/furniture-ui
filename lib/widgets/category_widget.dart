import 'package:flutter/material.dart';
import 'package:flutter_ui_four/constants/constants.dart';
import 'package:flutter_ui_four/pages/info_page.dart';

class CategoryWidget extends StatefulWidget {
  final String img;
  final String title;
  final String address;
  final String price;

  const CategoryWidget({
    Key key,
    this.img,
    this.address,
    this.title,
    this.price,
  }) : super(key: key);

  @override
  _CategoryWidgetState createState() => _CategoryWidgetState();
}

class _CategoryWidgetState extends State<CategoryWidget>
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
      onTapCancel: () {
        controller.reverse();
      },
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => InfoPage(
            tag: widget.img,
            title: widget.title,
            address: widget.address,
            price: widget.price,
          ),
        ),
      ),
      child: ScaleTransition(
        scale: bounceTap,
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          height: double.infinity,
          width: 210,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(5),
            boxShadow: [
              BoxShadow(
                blurRadius: 15,
                color: Colors.black12,
              ),
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
                          fontSize: 14,
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
                          fontSize: 12,
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
