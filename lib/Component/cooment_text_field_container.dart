import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';


class CommentTextFieldContainer extends StatelessWidget {
  final Widget child;
  const CommentTextFieldContainer({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.symmetric(vertical: 2,horizontal: 10),
      padding: EdgeInsets.only(left: 10,top: 10,bottom: 4),
      alignment: Alignment.topLeft,

      decoration: BoxDecoration(
        color: Colors.white,
        /*color: Color.fromRGBO(58, 66, 86, .9),
          gradient: LinearGradient(
              colors: [kSecondaryLightColor.withOpacity(0.4), kSecondaryColor.withOpacity(0.9)]),*/
          border: Border.all(
            color: Colors.grey.shade400,
            width: 2,
          ),
        borderRadius: BorderRadius.circular(5),
      ),
      child: child,
    );
  }
}
