import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sp_flutter_app/shared/widgets/bottom_bar.dart';
import 'package:sp_flutter_app/shared/widgets/create_event_dialog.dart';
import 'package:sp_flutter_app/shared/widgets/main_drawer.dart';

import '../constants.dart';
import 'gradient_background.dart';

class ScaffoldWithGradient extends StatelessWidget {
  const ScaffoldWithGradient({
    Key key,
    this.children,
    this.menuColor,
    this.bottomBar,
  }) : super(key: key);

  final List<Widget> children;
  final Color menuColor;
  final bool bottomBar;

  Widget _menuButton(BuildContext context) {
    return Navigator.of(context).canPop()
        ? SvgPicture.asset(
            "assets/svgs/arrow-left2.svg",
            color: menuColor ?? Colors.white,
            height: 24,
            width: 24,
          )
        : Icon(
            Icons.menu,
            color: menuColor ?? Colors.white,
            size: 36,
          );
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      extendBodyBehindAppBar: true,
      bottomNavigationBar: bottomBar == true
          ? BottomNavBar(
              defaultSelectedIndex: 1,
              onChange: (val) {
                if (val == 0) {
                  createEventDialog(context);
                }
              },
              iconList: [
                Icons.add_circle,
                Icons.home,
                Icons.find_in_page,
                Icons.person,
              ],
              NBID: 0,
            )
          : SizedBox(),
      appBar: AppBar(
        titleSpacing: 0.0,
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        automaticallyImplyLeading: false, // Don't show the leading button
        title: Container(
          alignment: Alignment.topLeft,
          child: Builder(
            builder: (context) => GestureDetector(
              onTap: () {
                // using maybePop allows for handling the case when there aren't
                // any routes to pop and the user would close the app with the back
                // button essentially
                Navigator.of(context).canPop()
                    ? Navigator.of(context).maybePop()
                    : Scaffold.of(context).openDrawer();
              },
              child: Padding(
                padding: const EdgeInsets.all(kDefaultPadding * 2.0),
                child: _menuButton(context),
              ),
            ),
          ),
        ),
      ),
      drawer: MainDrawer(),
      body: Stack(
        children: [
          GradientBackground(),
          ...children,
        ],
      ),
    );
  }
}
