
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:test_itti/models/user_response.dart';
import 'package:http/http.dart' as http;

class UserApiServices extends ChangeNotifier {

  List<UserAPI> users = [];

  bool isLoading = false;

  final _baseUrl = "https://reqres.in/api/users";

  UserApiServices() {
    getUsers();
  }

  Future<List<UserAPI>> getUsers() async {
    isLoading = true;
    notifyListeners();

    final url = Uri.parse(_baseUrl);
    final resp = await http.get(url);
    final Map<String,dynamic> usersMap = json.decode(resp.body);
    final userResponse = UserResponse.fromJson(usersMap);

    users = userResponse.users;
    isLoading = false;
    notifyListeners();

    return users;
  }
}