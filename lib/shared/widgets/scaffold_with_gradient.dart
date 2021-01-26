import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../constants.dart';
import 'gradient_background.dart';

class ScaffoldWithGradient extends StatelessWidget {
  const ScaffoldWithGradient({
    Key key,
    this.children,
  }) : super(key: key);

  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        titleSpacing: 0.0,
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        automaticallyImplyLeading: false, // Don't show the leading button
        title: Container(
          alignment: Alignment.topLeft,
          child: GestureDetector(
            onTap: () {
              Navigator.of(context).pop();
            },
            child: Padding(
              padding: const EdgeInsets.all(kDefaultPadding * 2.0),
              child: SvgPicture.asset(
                "assets/svgs/arrow-left2.svg",
                color: Colors.white,
                height: 24,
                width: 24,
              ),
            ),
          ),
        ),
      ),
      body: Stack(
        children: [
          GradientBackground(),
          ...children,
        ],
      ),
    );
  }
}
