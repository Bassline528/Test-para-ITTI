

import 'package:flutter/material.dart';
import 'package:test_itti/pages/form_userdb.dart';
import 'package:test_itti/pages/home.dart';
import 'package:test_itti/pages/user_db_page.dart';
import 'package:test_itti/pages/users_api.dart';

final Map<String,WidgetBuilder> appRoutes = {
  UsersDBPage.routeName           : (_) => UsersDBPage(),
  UsersApiPage.routeName          : (_) => UsersApiPage(),
  HomePage.routeName              : (_) => HomePage(),
  FormUserPage.routeName          : (_) => FormUserPage()
};