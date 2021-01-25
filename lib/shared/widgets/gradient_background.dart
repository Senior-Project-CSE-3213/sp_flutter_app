import 'package:flutter/material.dart';

import '../constants.dart';

class GradientBackground extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            color: kPrimaryColor,
          ),
        ),
        Positioned.fill(
          top: size.height * -0.75,
          left: size.width * -0.75,
          child: Container(
            child: Opacity(
              opacity: 0.350,
              child: Container(
                width: size.height * 0.35,
                height: size.height * 0.35,
                decoration: BoxDecoration(
                  gradient: RadialGradient(
                    colors: [
                      const Color(0xff8350DB),
                      const Color(0xff191A21),
                    ],
                  ),
                  shape: BoxShape.circle,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
