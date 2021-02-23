import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sp_flutter_app/views/event_detail_view.dart';
import 'package:sp_flutter_app/views/user_profiles.dart';
import 'views/event_map.dart';
import 'views/help.dart';
import 'views/profile.dart';
import 'views/settings.dart';
import 'views/wrapper.dart';
import 'shared/constants.dart';
import 'viewmodels/user_viewmodel.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => UserViewModel()),
      ],
      child: MaterialApp(initialRoute: eventMapScreenRoute, routes: {
        eventMapScreenRoute: (_) => Wrapper(child: EventMap()),
        profileScreenRoute: (context) => ProfileScreen(),
        helpScreenRoute: (_) => HelpScreen(),
        settingScreenRoute: (_) => SettingScreen(),
        eventDetailScreenRoute: (_) => EventDetailScreen(),
        allUserProfilesScreenRoute: (_) => UserProfiles()
      }),
    );
  }
}
