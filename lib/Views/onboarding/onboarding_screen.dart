import 'package:final_project/Views/onboarding/widgets/elevated_button.dart';
import 'package:final_project/Views/signIn/signIn_screen.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final box = GetStorage();
    final double height = MediaQuery.sizeOf(context).height;
    final double width = MediaQuery.sizeOf(context).width;
    return Scaffold(
      backgroundColor: Color(0xFF121217),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(15),
            height: height * .4,
            width: width,
            decoration: BoxDecoration(color: Colors.white),
            child: Image.asset("assets/images/onboarding_background.png"),
          ),

          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 15),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      Text(
                        textAlign: TextAlign.center,
                        "Welcome to your personal blog space",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 28,
                          fontFamily: "newsReader",
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(
                        textAlign: TextAlign.center,
                        "Siscover articles,save your favorites,and endgage with the community.",
                        style: TextStyle(
                          color: Colors.white.withOpacity(.7),
                          fontSize: 16,
                          fontFamily: "newsReader",
                        ),
                      ),
                    ],
                  ),
                  CustomElevatedButton(
                    buttonText: "Get Started",
                    onTap: () {
                      box.write("onboarding_done", true);
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return SigninScreen();
                          },
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
