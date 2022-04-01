import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_itti/pages/user_db_page.dart';
import 'package:test_itti/pages/users_api.dart';
import 'package:test_itti/services/db_provider.dart';
import 'package:test_itti/services/ui_provider.dart';
import 'package:test_itti/services/users_list.dart';
import 'package:test_itti/widgets/custom_navigation_bar.dart';


class HomePage extends StatelessWidget {

  static String routeName = 'home';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        title: Text('Home'),
        actions: [
          IconButton(
            onPressed: () {
              Provider.of<UsersListProvider>(context, listen: false).deleteAll();
            }, 
            icon: Icon(Icons.delete_forever)
          )
        ],
     ),
     body: _HomePageBody(),
     bottomNavigationBar: CustomNavigationBar(),
   );
  }
}


class _HomePageBody extends StatelessWidget {
  const _HomePageBody({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final uIProvider = Provider.of<UIProvider>(context);

    final currentIndex = uIProvider.selectedMenuOpt;

    // DBProvider.db.database

    final usersListProvider = Provider.of<UsersListProvider>(context, listen: false);

    switch (currentIndex) {
      case 0:
        usersListProvider.addUsers();
        return UsersDBPage();
      case 1:
        return UsersApiPage();
      default:
        return UsersDBPage();
    }
  }
}