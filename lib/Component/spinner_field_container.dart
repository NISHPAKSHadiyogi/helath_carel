import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';


import 'Utils.dart';

class SpinnerFieldContainer extends StatelessWidget {
  final Widget child;
  const SpinnerFieldContainer({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: 30,
      margin: EdgeInsets.symmetric(vertical: 10),
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      width: size.width * 0.5,
      decoration: BoxDecoration(
        color: Utils.white,
        borderRadius: BorderRadius.circular(29),
      ),
      child: child,
    );
  }
}
