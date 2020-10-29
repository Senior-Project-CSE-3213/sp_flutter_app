import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sp_flutter_app/shared/constants.dart';

class Background extends StatelessWidget {
  final Widget child;
  Background({
    Key key,
    @required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
        height: size.height,
        width: double.infinity,
        child: Stack(
          alignment: Alignment.center,
          children: <Widget>[
            Positioned(
              top: 0,
              left: 0,
              child: SvgPicture.asset(
                "assets/svgs/top_wavy.svg",
                height: size.height * 0.25,
                color: kPrimaryLightColor,
              ),
            ),
            child,
          ],
        ),
    );
  }
}
