import 'package:final_project/utils/api_config.dart';

class ApiEndPoint {
  static String registerEndPoint = "${ApiConfig.baseUrl}auth/register";
  static String loginEndPoint = "${ApiConfig.baseUrl}auth/login";
  static String blogEndPoint = "${ApiConfig.baseUrl}posts";
  static String profileEndPoint = "${ApiConfig.baseUrl}user/profile";
  static String logoutEndPoint = "${ApiConfig.baseUrl}auth/logout";
}
