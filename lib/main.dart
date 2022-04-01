import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_itti/routes/routes.dart';
import 'package:test_itti/services/api_services.dart';
import 'package:test_itti/services/db_provider.dart';
import 'package:test_itti/services/ui_provider.dart';
import 'package:test_itti/services/users_list.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider( create: (_) => UsersListProvider()),
        ChangeNotifierProvider(create: (_) => UIProvider()),
        ChangeNotifierProvider(create: (_) => UserApiServices()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Material App',
        initialRoute: 'home',
        routes: appRoutes,
      ),
    );
  }
}