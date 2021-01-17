import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

class OnboardingView extends StatelessWidget {
  final onboardingSvgs = [
    "undraw_adventure.svg",
    "undraw_current_location.svg",
    "undraw_team_up.svg"
  ];

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: const Color(0xff181a25),
      body: Column(
        children: [
          Container(
            height: size.height * 0.5,
            color: Colors.white,
            child: Swiper(
              itemBuilder: (_, int index) {
                return ClipRRect(
                  borderRadius: new BorderRadius.all(new Radius.circular(32)),
                  child: SvgPicture.asset(
                    "assets/svgs/" + onboardingSvgs[index],
                    height: size.height * 0.4,
                    width: size.width - 2 * 64,
                  ),
                );
              },
              itemWidth: size.width - 2 * 64,
              autoplay: true,
              itemCount: onboardingSvgs.length,
              pagination: SwiperPagination(),
            ),
          ),
          Container(
            margin: EdgeInsets.all(24),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Meet,\nPlay,\nChat',
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 42,
                    color: const Color(0xffffffff),
                    fontWeight: FontWeight.w700,
                  ),
                  textAlign: TextAlign.left,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
