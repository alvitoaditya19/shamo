import 'dart:convert';

import 'package:shamo/models/user_model.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class AuthService {
  String baseUrl = 'http://10.0.2.2:8081/shamo-backend-second/server.php/api';
  // 'https://shamo-backend.buildwithangga.id/api'
  // 'http://10.0.2.2:8000/api'
  // 'http://shamo-backend-main.test:8081/api'
  // 'http://localhost:8081/shamo-backend-second/server.php/api/categories'

  Future<UserModel> register({
    String name,
    String username,
    String email,
    String password,
  }) async {
    var url = '$baseUrl/register';
    var headers = {'Content-type': 'application/json'};
    var body = jsonEncode({
      'name': name,
      'username': username,
      'email': email,
      'password': password,
    });
    var response = await http.post(
      url,
      headers: headers,
      body: body,
    );
    print(response.body);
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body)['data'];
      UserModel user = UserModel.fromJson(data['user']);
      user.token = 'Bearer ' + data['access_token'];
      return user;
    } else {
      throw Exception('Gagal Register');
    }
  }

  Future<UserModel> login({
    String email,
    String password,
  }) async {
    var url = '$baseUrl/login';
    var headers = {'Content-type': 'application/json'};
    var body = jsonEncode({
      'email': email,
      'password': password,
    });
    var response = await http.post(
      url,
      headers: headers,
      body: body,
    );
    print(response.body);
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body)['data'];
      UserModel user = UserModel.fromJson(data['user']);
      user.token = 'Bearer ' + data['access_token'];

      final prefs = await SharedPreferences.getInstance();

      prefs.setString("emailUser", email);
      prefs.setString("password", password);
      prefs.setString("userToken", user.token);
      prefs.setBool("loggedIn", true);

      return user;
    } else {
      throw Exception('Gagal Login');
    }
  }
}
