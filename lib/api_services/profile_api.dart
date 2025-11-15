import 'dart:convert';

import 'package:final_project/models/profile_model.dart';
import 'package:final_project/utils/api_end_point.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;

class ProfileApi {
  final box = GetStorage();
  Future<ProfileModel> profileUser() async {
    final Uri uri = Uri.parse(ApiEndPoint.profileEndPoint);

    final String? token = box.read("token");
    final response = await http.get(
      uri,
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      },
    );
    final jsonResponse = jsonDecode(response.body);

    if (response.statusCode == 200) {
      return ProfileModel.fromJson(jsonResponse);
    } else {
      throw Exception('Failed : ${response.statusCode}');
    }
  }
}
