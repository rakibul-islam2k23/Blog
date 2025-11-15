import 'package:final_project/Views/onboarding/widgets/elevated_button.dart';
import 'package:final_project/Views/widgets/custom_appbar.dart';
import 'package:final_project/Views/widgets/custom_edittext.dart';
import 'package:final_project/Views/widgets/custom_text.dart';
import 'package:final_project/api_services/register_api.dart';
import 'package:flutter/material.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();

    final TextEditingController userNameController = TextEditingController();
    final TextEditingController emailController = TextEditingController();
    final TextEditingController phoneController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();
    final TextEditingController confirmPasswordController =
        TextEditingController();

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
            child: Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomText(text: "Username"),
                  CustomEditText(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Username required';
                      }
                      return null;
                    },
                    controller: userNameController,
                    hintText: "Enter your username",
                    type: TextInputType.text,
                  ),

                  CustomText(text: "Email"),
                  CustomEditText(
                    validator: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return 'Email is required';
                      }
                      if (!value.contains('@') ||
                          !value.endsWith('@gmail.com')) {
                        return 'Enter a valid Gmail address';
                      }
                      return null;
                    },
                    controller: emailController,
                    hintText: "Enter your email",
                    type: TextInputType.emailAddress,
                  ),

                  CustomText(text: "Phone"),
                  CustomEditText(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Phone required';
                      }
                      return null;
                    },
                    controller: phoneController,
                    hintText: "Enter your phone",
                    type: TextInputType.phone,
                  ),

                  CustomText(text: "Password"),
                  CustomEditText(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Password is required';
                      }
                      if (value.length < 8) {
                        return 'Must be at least 8 characters';
                      }
                      return null;
                    },
                    controller: passwordController,
                    hintText: "Enter your password",
                    type: TextInputType.visiblePassword,
                  ),

                  CustomText(text: "Confirm Password"),
                  CustomEditText(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Password is required';
                      }
                      if (value.length < 8) {
                        return 'Must be at least 8 characters';
                      }
                      if (value != passwordController.text) {
                        return 'Passwords do not match';
                      }
                      return null;
                    },
                    controller: confirmPasswordController,
                    hintText: "Enter your password",
                    type: TextInputType.visiblePassword,
                  ),
                  SizedBox(height: height * .02),

                  CustomElevatedButton(
                    buttonText: "Register",
                    onTap: () {
                      if (formKey.currentState!.validate()) {
                        RegisterApi().registerUser(
                          userNameController.text,
                          emailController.text,
                          passwordController.text,
                          phoneController.text,
                          context,
                        );
                      }
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
