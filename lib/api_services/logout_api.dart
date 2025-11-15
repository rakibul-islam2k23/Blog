import 'package:final_project/Views/signIn/signIn_screen.dart';
import 'package:final_project/utils/api_end_point.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;

class LogoutApi {
  final box = GetStorage();

  Future<void> logoutUser(BuildContext context) async {
    final Uri uri = Uri.parse(ApiEndPoint.logoutEndPoint);
    final String? token = box.read("token");

    final response = await http.post(
      uri,
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      },
    );

    if (response.statusCode == 200) {
      print('Logout successful');
      await box.remove('token');
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) {
            return SigninScreen();
          },
        ),
      );
    } else {
      print('Logout failed: ${response.statusCode}');
      throw Exception('Logout failed: ${response.body}');
    }
  }
}
