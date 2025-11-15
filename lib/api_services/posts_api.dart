import 'dart:convert';
import 'package:final_project/models/posts_model.dart';
import 'package:final_project/utils/api_end_point.dart';
import 'package:http/http.dart' as http;

class PostsApi {
  Future<PostsModel> fetchPosts() async {
    final url = Uri.parse(ApiEndPoint.blogEndPoint);

    final response = await http.get(url);
    final jsonResponse = jsonDecode(response.body);

    if (response.statusCode == 200) {
      return PostsModel.fromJson(jsonResponse);
    } else {
      throw Exception('Failed : ${response.statusCode}');
    }
  }
}
