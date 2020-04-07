import 'package:flutter/material.dart';
import 'package:flutter_ui_four/constants/constants.dart';

class FurnitureIcon extends StatefulWidget {
  final Icon icon;
  final String label;

  FurnitureIcon({this.icon, this.label});

  @override
  _FurnitureIconState createState() => _FurnitureIconState();
}

class _FurnitureIconState extends State<FurnitureIcon>
    with SingleTickerProviderStateMixin {
  AnimationController controller;

  Animation<double> iconScale;

  @override
  void initState() {
    super.initState();
    controller =
        new AnimationController(vsync: this, duration: Duration(seconds: 3));

    iconScale = new Tween<double>(
      begin: 0,
      end: 1,
    ).animate(CurvedAnimation(
      parent: controller,
      curve: Interval(0.6, 1.0, curve: Curves.elasticOut),
    ));

    controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      width: 70,
      margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(5),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 20,
          )
        ],
      ),
      child: Center(
        child: ScaleTransition(
          scale: iconScale,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              widget.icon,
              Text(
                widget.label,
                style: TextStyle(
                  fontFamily: pSBold,
                  fontSize: 10,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
