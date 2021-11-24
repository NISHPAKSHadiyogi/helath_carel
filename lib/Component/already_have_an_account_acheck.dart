import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';


import 'AppString.dart';
import 'Utils.dart';

class AlreadyHaveAnAccountCheck extends StatelessWidget {
  final bool login;
  final Function press;
  const AlreadyHaveAnAccountCheck({
    Key? key,
    this.login = true,
    required this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          login
              ? AppString().dont_have_an_account + "? "
              : AppString().already_have_an_account + "? ",
          style: TextStyle(color: Utils.white),
        ),
        GestureDetector(
          onTap: press(),
          child: Text(
            login ? AppString().login : AppString().register,
            style: TextStyle(
              color: Utils.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        )
      ],
    );
  }
}
