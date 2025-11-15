import 'dart:convert';
import 'package:final_project/Views/home/home_screen.dart';
import 'package:final_project/utils/api_end_point.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;

class LoginApi {
  final box = GetStorage();
  Future<void> loginUser(
    String email,
    String password,
    BuildContext context,
  ) async {
    final Uri uri = Uri.parse(ApiEndPoint.loginEndPoint);
    final response = await http.post(
      uri,
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({"email": email, "password": password}),
    );

    final data = jsonDecode(response.body);

    if (response.statusCode == 200) {
      box.write('token', data['data']['token']);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(backgroundColor: Colors.green, content: Text(data['message'])),
      );
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) {
            return HomeScreen();
          },
        ),
      );

      // print('Response: ${response.body}');
      // final token = box.read('token');
      // print("Token : $token");
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(backgroundColor: Colors.red, content: Text(data['message'])),
      );
      // print('Failed with status code: ${response.statusCode}');
      // print('Response: ${response.body}');
    }
  }
}
