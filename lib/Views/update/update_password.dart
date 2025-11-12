import 'package:final_project/Views/onboarding/widgets/elevated_button.dart';
import 'package:final_project/Views/widgets/custom_appbar.dart';
import 'package:final_project/Views/widgets/custom_edittext.dart';
import 'package:final_project/Views/widgets/custom_text.dart';
import 'package:flutter/material.dart';

class UpdatePassword extends StatelessWidget {
  const UpdatePassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60),
        child: CustomAppbar(
          title: "Update Password",
          leadingIcon: Icon(Icons.arrow_back_ios, color: Colors.white),
          onTap: () {
            Navigator.pop(context);
          },
        ),
      ),

      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(right: 15, left: 15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomText(text: "Current Password"),
                      CustomEditText(
                        hintText: "Enter your current password",
                        type: TextInputType.visiblePassword,
                      ),

                      CustomText(text: "New Password"),
                      CustomEditText(
                        hintText: "Enter your new password",
                        type: TextInputType.visiblePassword,
                      ),

                      CustomText(text: "Confirm new Password"),
                      CustomEditText(
                        hintText: "Confirm your new password",
                        type: TextInputType.visiblePassword,
                      ),
                    ],
                  ),
                ),
              ),
              CustomElevatedButton(buttonText: "Update Password", onTap: () {}),
            ],
          ),
        ),
      ),
    );
  }
}
