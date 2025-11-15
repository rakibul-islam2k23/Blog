import 'package:device_preview/device_preview.dart';
import 'package:final_project/Views/home/home_screen.dart';
import 'package:final_project/Views/onboarding/onboarding_screen.dart';
import 'package:final_project/Views/signIn/signIn_screen.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  final box = GetStorage();

  final bool onboardingDone = box.read("onboarding_done") ?? false;

  final String? tokenValue = box.read("token");
  final bool isLoggedIn = tokenValue != null && tokenValue.isNotEmpty;

  runApp(
    DevicePreview(
      enabled: !kReleaseMode,
      builder:
          (context) =>
              MyApp(showOnboarding: !onboardingDone, isLoggedIn: isLoggedIn),
    ),
  );
}

class MyApp extends StatelessWidget {
  final bool showOnboarding;
  final bool isLoggedIn;

  const MyApp({
    super.key,
    required this.showOnboarding,
    required this.isLoggedIn,
  });

  @override
  Widget build(BuildContext context) {
    Widget initialScreen;

    if (showOnboarding) {
      initialScreen = OnboardingScreen();
    } else if (!isLoggedIn) {
      initialScreen = SigninScreen();
    } else {
      initialScreen = HomeScreen();
    }

    return MaterialApp(debugShowCheckedModeBanner: false, home: initialScreen);
  }
}
