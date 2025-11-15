import 'dart:convert';

import 'package:final_project/Views/signIn/signIn_screen.dart';
import 'package:final_project/utils/api_end_point.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class RegisterApi {
  Future<void> registerUser(
    String name,
    String email,
    String phone,
    String password,
    BuildContext context,
  ) async {
    final Uri uri = Uri.parse(ApiEndPoint.registerEndPoint);
    final response = await http.post(
      uri,
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        "name": name,
        "email": email,
        "password": password,
        "phone": phone,
      }),
    );

    final data = jsonDecode(response.body);

    if (response.statusCode == 200 || response.statusCode == 201) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(backgroundColor: Colors.green, content: Text(data['message'])),
      );
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) {
            return SigninScreen();
          },
        ),
      );

      print('Response: ${response.body}');
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(backgroundColor: Colors.pink, content: Text(data['message'])),
      );
      print('Failed with status code: ${response.statusCode}');
      print('Response: ${response.body}');
    }
  }
}
