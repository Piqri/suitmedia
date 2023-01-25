import 'dart:convert';

import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;
import 'package:suitmedia_project/model/user_model.dart';

class UserViewModel with ChangeNotifier {
  Future<User> getAllUser() async {
    final response = await http.get(Uri.parse('https://reqres.in/api/users/'));
    if (response.statusCode == 200) {
      print(response.body);
      return User.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load album');
    }
  }
}
