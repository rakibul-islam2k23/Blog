import 'package:final_project/Views/onboarding/widgets/elevated_button.dart';
import 'package:final_project/Views/widgets/custom_appbar.dart';
import 'package:final_project/api_services/logout_api.dart';
import 'package:final_project/api_services/profile_api.dart';
import 'package:final_project/models/profile_model.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.sizeOf(context).height;
    final double width = MediaQuery.sizeOf(context).width;
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: CustomAppbar(
          title: "Profile",
          actionIcon: const Icon(Icons.settings, color: Colors.white),
          onTap: () => Navigator.pop(context),
        ),
      ),

      body: SafeArea(
        child: FutureBuilder<ProfileModel>(
          future: ProfileApi().profileUser(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            } else {
              return Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          Center(
                            child: Column(
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                    color: Colors.black,
                                  ),
                                  width: width * .3,
                                  height: height * .15,
                                  child: CircleAvatar(),
                                ),
                                SizedBox(height: 20),

                                Text(
                                  snapshot.data!.data.user.name,
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 22,
                                    fontFamily: "inter",
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  snapshot.data!.data.user.email,
                                  style: TextStyle(
                                    color: Colors.white.withOpacity(.5),
                                    fontSize: 16,
                                    fontFamily: "inter",
                                  ),
                                ),
                                Text(
                                  "Software Engineer",
                                  style: TextStyle(
                                    color: Colors.white.withOpacity(.5),
                                    fontSize: 16,
                                    fontFamily: "inter",
                                  ),
                                ),
                              ],
                            ),
                          ),

                          Padding(
                            padding: const EdgeInsets.symmetric(
                              vertical: 20,
                              horizontal: 15,
                            ),
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Container(
                                      width: 40,
                                      height: 40,
                                      decoration: BoxDecoration(
                                        color: Colors.white.withOpacity(.2),
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      child: Icon(
                                        Icons.edit,
                                        color: Colors.white,
                                      ),
                                    ),
                                    SizedBox(width: 10),
                                    Text(
                                      "Edit Profile",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 18,
                                        fontFamily: "inter",
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: height * .02),
                                Row(
                                  children: [
                                    Container(
                                      width: 40,
                                      height: 40,
                                      decoration: BoxDecoration(
                                        color: Colors.white.withOpacity(.2),
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      child: Icon(
                                        Icons.lock,
                                        color: Colors.white,
                                      ),
                                    ),
                                    SizedBox(width: 10),
                                    Text(
                                      "Update Password",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 18,
                                        fontFamily: "inter",
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: CustomElevatedButton(
                      buttonText: "Logout",
                      onTap: () {
                        LogoutApi().logoutUser(context);
                      },
                    ),
                  ),
                ],
              );
            }
          },
        ),
      ),
    );
  }
}
