import 'package:flutter/material.dart';

class Background extends StatelessWidget {
  final Widget child;
  const Background({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SizedBox(
      height: size.height,
      width: double.infinity,
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
            left: 0,
            child: Image.asset(
              'assets/images/bottom_main.png',
              width: size.width * 0.4,
            ),
          ),
          child,
        ],
      ),
    );
  }
}
