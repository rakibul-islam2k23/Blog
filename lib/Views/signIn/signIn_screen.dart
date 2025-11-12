import 'package:final_project/Views/onboarding/widgets/elevated_button.dart';
import 'package:final_project/Views/signup/signup_screen.dart';
import 'package:final_project/Views/widgets/custom_appbar.dart';
import 'package:flutter/material.dart';

class SigninScreen extends StatelessWidget {
  const SigninScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.sizeOf(context).height;
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60),
        child: CustomAppbar(
          title: "Sign In",
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
                    children: [
                      Center(
                        child: Text(
                          textAlign: TextAlign.center,
                          "Welcome Back!",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                            fontFamily: "inter",
                          ),
                        ),
                      ),
                      SizedBox(height: 20),

                      Column(
                        children: [
                          TextFormField(
                            style: TextStyle(
                              color: Colors.white,
                              fontFamily: "inter",
                              fontSize: 16,
                            ),
                            maxLines: 1,
                            keyboardType: TextInputType.emailAddress,
                            decoration: InputDecoration(
                              hintText: "Email",
                              border: InputBorder.none,
                              filled: true,
                              contentPadding: EdgeInsets.symmetric(
                                vertical: 10,
                                horizontal: 20,
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(10),
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(10),
                                ),
                              ),
                              fillColor: Color(0xFF292E38),
                              hintStyle: TextStyle(
                                color: Color(0xFF9EA6BA),
                                fontSize: 16,
                                fontFamily: "inter",
                              ),
                            ),
                          ),
                          SizedBox(height: 20),

                          TextFormField(
                            style: TextStyle(
                              color: Colors.white,
                              fontFamily: "inter",
                              fontSize: 16,
                            ),
                            maxLines: 1,
                            keyboardType: TextInputType.visiblePassword,
                            decoration: InputDecoration(
                              hintText: "Password",
                              border: InputBorder.none,
                              filled: true,
                              contentPadding: EdgeInsets.symmetric(
                                vertical: 10,
                                horizontal: 20,
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(10),
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(10),
                                ),
                              ),
                              fillColor: Color(0xFF292E38),
                              hintStyle: TextStyle(
                                color: Color(0xFF9EA6BA),
                                fontSize: 16,
                                fontFamily: "inter",
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: height * .07),
                      CustomElevatedButton(
                        buttonText: "Sign In",
                        onTap: () {},
                        fontFamily: "inter",
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: height * .02),

              Column(
                children: [
                  Text(
                    textAlign: TextAlign.center,
                    "Don't have an account?",
                    style: TextStyle(
                      color: Color(0xFF9EA6BA),
                      fontSize: 14,
                      fontFamily: "inter",
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return SignupScreen();
                          },
                        ),
                      );
                    },
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return SignupScreen();
                            },
                          ),
                        );
                      },
                      child: Text(
                        textAlign: TextAlign.center,
                        "Sign Up",
                        style: TextStyle(
                          color: Color(0xFF9EA6BA),
                          fontSize: 14,
                          fontFamily: "inter",
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
