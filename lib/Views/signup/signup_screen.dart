import 'package:final_project/Views/onboarding/widgets/elevated_button.dart';
import 'package:final_project/Views/widgets/custom_appbar.dart';
import 'package:final_project/Views/widgets/custom_edittext.dart';
import 'package:final_project/Views/widgets/custom_text.dart';
import 'package:flutter/material.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.sizeOf(context).height;
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60),
        child: CustomAppbar(
          onTap: () {
            Navigator.pop(context);
          },
          leadingIcon: Icon(Icons.arrow_back_ios, color: Colors.white),
          title: "Create account",
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomText(text: "Username"),
                CustomEditText(
                  hintText: "Enter your username",
                  type: TextInputType.text,
                ),

                CustomText(text: "Email"),
                CustomEditText(
                  hintText: "Enter your email",
                  type: TextInputType.emailAddress,
                ),

                CustomText(text: "Phone"),
                CustomEditText(
                  hintText: "Enter your phone",
                  type: TextInputType.phone,
                ),

                CustomText(text: "Password"),
                CustomEditText(
                  hintText: "Enter your password",
                  type: TextInputType.visiblePassword,
                ),

                CustomText(text: "Confirm Password"),
                CustomEditText(
                  hintText: "Enter your password",
                  type: TextInputType.visiblePassword,
                ),
                SizedBox(height: height * .02),

                CustomElevatedButton(buttonText: "Register", onTap: () {}),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
