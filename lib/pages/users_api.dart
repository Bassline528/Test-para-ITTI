import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_itti/models/user_response.dart';
import 'package:test_itti/services/api_services.dart';

import '../widgets/loading.dart';


class UsersApiPage extends StatelessWidget {

  static String routeName = 'usersapi';


  @override
  Widget build(BuildContext context) {

    final userApiService = Provider.of<UserApiServices>(context);

    final users = userApiService.users;

    return userApiService.isLoading ? LoadingScreen() : 

     Scaffold(
      body: ListView.builder(
        itemCount: users.length,
        itemBuilder: (context, index) => GestureDetector(
          onLongPress: () {
            //borrar
          } ,
          child: _UserCard(user: users[index])
        )
      )
   );
  }
}

class _UserCard extends StatelessWidget {

  final UserAPI user;
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
            _UserAvatar(imageUrl: user.avatar),
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

  final UserAPI user;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: EdgeInsets.only(top: 10),
          child: Text("${user.firstName}, ${user.lastName}",style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),)
        ),
        Container(
          margin: EdgeInsets.only(top: 10),
          child: Text("${user.email}",style: TextStyle(fontSize: 15),)
        ),
      ],
    );
  }
}

class _UserAvatar extends StatelessWidget {
  const _UserAvatar({ Key? key, required this.imageUrl }) : super(key: key);
  final String imageUrl;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(5),
      child: ClipRRect(
        borderRadius:BorderRadius.circular(100),
        // ignore: unnecessary_null_comparison
        child: imageUrl  ==  null 
          ?const Image(
            image: AssetImage('assets/no-image.png'),
            fit: BoxFit.cover,
          )
    
          : FadeInImage(
            image: NetworkImage(imageUrl),
            placeholder: const AssetImage('assets/jar-loading.gif'),
            fit: BoxFit.cover,
          )
      ),
    );
  }
}