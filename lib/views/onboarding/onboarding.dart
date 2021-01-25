import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:sp_flutter_app/shared/constants.dart';

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
      backgroundColor: kPrimaryColor,
      body: SingleChildScrollView(
        child: Column(
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
              margin: EdgeInsets.all(kDefaultPadding * 2.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Schedule,\nMeet Up,\nChat',
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
            Container(
              width: size.width,
              margin: EdgeInsets.symmetric(horizontal: kDefaultPadding * 2.0),
              child: FlatButton(
                onPressed: () {
                  Navigator.of(context).pushNamed(signInEmailViewRoute);
                },
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(48),
                ),
                color: const Color(0xff246bfd),
                child: Padding(
                  padding: const EdgeInsets.all(kDefaultPadding),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset(
                        "assets/svgs/envelop.svg",
                        height: 24,
                      ),
                      SizedBox(width: 16),
                      Text(
                        'Continue with Email',
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
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(
                  horizontal: kDefaultPadding * 2.0, vertical: kDefaultPadding),
              child: OutlineButton(
                onPressed: () {
                  Navigator.of(context).pushNamed(signInEmailViewRoute);
                },
                borderSide: BorderSide(color: Colors.white),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(48),
                ),
                color: const Color(0xff246bfd),
                child: Padding(
                  padding: const EdgeInsets.all(kDefaultPadding),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset(
                        "assets/svgs/google.svg",
                        height: 24,
                      ),
                      SizedBox(width: 16),
                      Text(
                        'Continue with Gmail',
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
                ),
              ),
            ),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Already registered?",
                    style: TextStyle(
                      color: Colors.grey[400],
                      fontSize: 16,
                      fontFamily: "Inter",
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(width: kDefaultPadding * 0.5),
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).pushNamed(signInViewRoute);
                    },
                    child: Text(
                      "Sign In",
                      style: TextStyle(
                        color: Colors.blue[600],
                        fontSize: 16,
                        fontFamily: "Inter",
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
