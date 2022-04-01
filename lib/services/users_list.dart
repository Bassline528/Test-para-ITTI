import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_itti/models/user_db.dart';
import 'package:test_itti/services/db_provider.dart';

class UsersListProvider extends ChangeNotifier {

  List<UserDB> users = [];

  Future<UserDB> newUser(String name, String birth, String sex) async {

    final newUser = UserDB(name: name, birth: birth, sex: sex);

    final id = await DBProvider.db.newUser(newUser);

    newUser.id = id;

    return newUser;
  }

  void addUsers() async {
    final users = await DBProvider.db.getAllUsers();
    this.users = [...users];
    notifyListeners();
  }

  // void addUserById(int id) async {
  //   final users = await DBProvider.db.getUserById(id);
  //   this.users = [...users];
  //   notifyListeners();
    
  // }



  void deleteAll() async {
    await DBProvider.db.deleteAllUsers();
    users = [];
    notifyListeners();
  }

  void deleteUserById(int id) async {
    await DBProvider.db.deleteUser(id);
  }





}