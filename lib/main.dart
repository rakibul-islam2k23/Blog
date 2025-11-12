import 'package:device_preview/device_preview.dart';
import 'package:final_project/Views/onboarding/onboarding_screen.dart';
import 'package:final_project/Views/signIn/signIn_screen.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  final GetStorage box = GetStorage();
  final bool onboardingDone = box.read("onboarding_done") ?? false;
  runApp(
    DevicePreview(
      enabled: !kReleaseMode,
      builder: (context) => MyApp(showOnboarding: !onboardingDone),
    ),
  );
}

class MyApp extends StatelessWidget {
  final bool showOnboarding;
  const MyApp({super.key, required this.showOnboarding});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: showOnboarding ? OnboardingScreen() : SigninScreen(),
    );
  }
}
