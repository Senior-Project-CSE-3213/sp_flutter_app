import 'package:flutter/material.dart';
import 'package:sp_flutter_app/presentation/Screens/Login/login_screen.dart';
import 'package:sp_flutter_app/presentation/Screens/Signup/components/background.dart';
import 'package:sp_flutter_app/presentation/Screens/Signup/components/or_divider.dart';
import 'package:sp_flutter_app/presentation/Screens/Signup/components/social_icon.dart';
import 'package:sp_flutter_app/presentation/widgets/already_have_an_account_acheck.dart';
import 'package:sp_flutter_app/presentation/widgets/rounded_button.dart';
import 'package:sp_flutter_app/presentation/widgets/rounded_input_field.dart';
import 'package:sp_flutter_app/presentation/widgets/rounded_password_field.dart';
import 'package:flutter_svg/svg.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "SIGNUP",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16.0,
              ),
            ),
            SizedBox(height: size.height * 0.03),
            SvgPicture.asset(
              "assets/svgs/undraw_nature_fun.svg",
              height: size.height * 0.35,
            ),
            SizedBox(height: size.height * 0.05),
            RoundedInputField(
              hintText: "Your Email",
              onChanged: (value) {},
            ),
            RoundedPasswordField(
              onChanged: (value) {},
            ),
            RoundedButton(
              text: "SIGNUP",
              press: () {},
            ),
            SizedBox(height: size.height * 0.03),
            // AlreadyHaveAnAccountCheck(
            //   login: false,
            //   press: () {
            //     Navigator.push(
            //       context,
            //       MaterialPageRoute(
            //         builder: (context) {
            //           return LoginScreen();
            //         },
            //       ),
            //     );
            //   },
            // ),
            // OrDivider(),
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.center,
            //   children: <Widget>[
            //     SocalIcon(
            //       iconSrc: "assets/icons/facebook.svg",
            //       press: () {},
            //     ),
            //     SocalIcon(
            //       iconSrc: "assets/icons/twitter.svg",
            //       press: () {},
            //     ),
            //     SocalIcon(
            //       iconSrc: "assets/icons/google-plus.svg",
            //       press: () {},
            //     ),
            //   ],
            // )
          ],
        ),
      ),
    );
  }
}
