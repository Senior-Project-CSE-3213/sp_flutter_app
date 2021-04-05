import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:sp_flutter_app/services/auth.dart';
import 'package:sp_flutter_app/shared/loading.dart';
import 'package:sp_flutter_app/viewmodels/user_profile_viewmodel.dart';
import 'package:sp_flutter_app/views/EventList/event_list_view.dart';
import 'package:sp_flutter_app/views/authenticate/create_profile.dart';
import 'package:sp_flutter_app/views/authenticate/using_email.dart';
import 'package:sp_flutter_app/views/authenticate/register.dart';
import 'package:sp_flutter_app/views/authenticate/sign_in.dart';
import 'package:sp_flutter_app/views/onboarding/onboarding.dart';
import 'views/map/map.dart';
import 'views/help/help.dart';
import 'views/profile/profile.dart';
import 'views/settings/settings.dart';
import 'shared/constants.dart';
import 'viewmodels/user_viewmodel.dart';

void main() async {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
  ));
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  final _authService = AuthService();
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => UserViewModel()),
        ChangeNotifierProvider(create: (_) => UserProfileViewModel())
      ],
      child: StreamBuilder(
        stream: _authService.user,
        builder: (context, userSnapshot) {
          if (userSnapshot.connectionState == ConnectionState.active) {
            return MaterialApp(
              routes: {
                usingEmailViewRoute: (_) => UsingEmail(),
                registerViewRoute: (_) => Register(),
                createProfileViewRoute: (_) => CreateProfile(),
                signInViewRoute: (_) => SignIn(),
                mapViewRoute: (_) => MapView(),
                eventViewRoute: (_) => EventListView(),
                profileViewRoute: (_) => ProfileScreen(),
                helpViewRoute: (_) => HelpScreen(),
                settingViewRoute: (_) => SettingScreen(),
              },
              initialRoute: mapViewRoute,
              home: userSnapshot.hasData ? MapView() : OnboardingView(),
            );
          } else {
            return MaterialApp(
              home: Loading(),
            );
          }
        },
      ),
    );
  }
}
