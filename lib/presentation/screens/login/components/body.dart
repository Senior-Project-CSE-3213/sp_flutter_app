import 'package:flutter/material.dart';
import 'package:sp_flutter_app/presentation/screens/login/components/background.dart';
import 'package:sp_flutter_app/presentation/screens/signup/signup_screen.dart';
import 'package:sp_flutter_app/presentation/widgets/already_have_an_account_acheck.dart';
import 'package:sp_flutter_app/presentation/widgets/rounded_button.dart';
import 'package:sp_flutter_app/presentation/widgets/rounded_input_field.dart';
import 'package:sp_flutter_app/presentation/widgets/rounded_password_field.dart';
import 'package:flutter_svg/svg.dart';

class Body extends StatelessWidget {
  const Body({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "LOGIN",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16.0,
              ),
            ),
            SizedBox(height: size.height * 0.03),
            SvgPicture.asset(
              "assets/svgs/undraw_setup.svg",
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
              text: "LOGIN",
              press: () {},
            ),
            SizedBox(height: size.height * 0.03),
            AlreadyHaveAnAccountCheck(
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return SignUpScreen();
                    },
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
