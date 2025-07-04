import 'package:flutter/material.dart';

class Background extends StatelessWidget {
  final Widget childe;
  const Background({
    super.key,
    required this.childe,
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SizedBox(
      width: double.infinity,
      height: size.height,
      child: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          Positioned(
            top: 60,
            left: 10,
            child: Image.asset(
              'assets/images/Kl.png',
              width: size.width * 0.2,
            ),
          ),
          Positioned(
            bottom: 0,
            right: 0,
            child: Image.asset(
              'assets/images/login_bottom.png',
              width: size.width * 0.4,
            ),
          ),
          childe,
        ],
      ),
    );
  }
}
