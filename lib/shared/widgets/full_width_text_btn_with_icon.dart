import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sp_flutter_app/shared/constants.dart';

class FullWidthTextButtonWithIcon extends StatelessWidget {
  const FullWidthTextButtonWithIcon({
    Key key,
    @required this.handleSubmit,
    @required this.svgAsset,
    @required this.text,
    this.outline,
    this.margin,
    this.svgColor,
    this.color,
  }) : super(key: key);

  final void Function({dynamic success}) handleSubmit;
  final String svgAsset;
  final String text;
  final outline;
  final EdgeInsets margin;
  final Color color;
  final Color svgColor;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    var child = Padding(
      padding: const EdgeInsets.all(kDefaultPadding),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(
            "$svgAsset",
            height: 24,
            color: svgColor,
          ),
          SizedBox(width: 16),
          Text(
            "$text",
            style: TextStyle(
              fontFamily: 'Poppins',
              fontSize: 18,
              color: Colors.white,
              fontWeight: FontWeight.w700,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
    return Container(
      width: size.width,
      margin: margin != null ? margin : EdgeInsets.all(0.0),
      child: outline != null
          ? OutlineButton(
              onPressed: () => handleSubmit(),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(48),
              ),
              borderSide: BorderSide(color: Colors.white),
              color: blueColor,
              child: child,
            )
          : FlatButton(
              onPressed: () => handleSubmit(),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(48),
              ),
              color: blueColor,
              child: child,
            ),
    );
  }
}
