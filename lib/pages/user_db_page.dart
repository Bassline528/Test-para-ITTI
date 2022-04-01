import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_itti/models/user_db.dart';

import '../services/users_list.dart';


class UsersDBPage extends StatelessWidget {

  static String routeName = 'userdb';

  @override
  Widget build(BuildContext context) {

    final usersListProvider = Provider.of<UsersListProvider>(context);

    final users = usersListProvider.users;

    return Scaffold(
      body: Scaffold(
      body: ListView.builder(
        itemCount: users.length,
        itemBuilder: (context, index) => _UserCard(user: users[index])
      )
    ),
     floatingActionButton: FloatingActionButton(
       onPressed: (() => {
         Navigator.pushNamed(context, 'form')
       }),
       child: const Icon(Icons.add),
       elevation: 1,
     ),
   );
  }
}

class _UserCard extends StatelessWidget {

  final UserDB user;
  _UserCard({ Key? key, required this.user }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Container(
        margin: const EdgeInsets.only(top:10, left: 20, right: 20),
        width: double.infinity,
        height: 70,
        decoration: _cardBorders(),
        child: Row(
          children: [
            // _UserAvatar(imageUrl: user.avatar),
            SizedBox(width: 10),
            _UserInfo(user: user)
          ],
        ),
      ),
      
    );
  }

  BoxDecoration _cardBorders() {
    return BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow:const <BoxShadow> [
          BoxShadow(
            color: Colors.black12,
            offset: Offset(0,7),
            blurRadius: 10
          )
        ]
      );
  }
}

class _UserInfo extends StatelessWidget {
  const _UserInfo({ Key? key, required this.user }) : super(key: key);

  final UserDB user;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: EdgeInsets.only(top: 10),
          child: Text("${user.name}",style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),)
        ),
        Container(
          child: Text("${user.birth}",style: TextStyle(fontSize: 15),)
        ),
        Container(
          child: Text("${user.sex}",style: TextStyle(fontSize: 15),)
        ),
      ],
    );
  }
}