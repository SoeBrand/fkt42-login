import 'package:fkt42login/models/user.dart';
import 'package:flutter/material.dart';

class UserDetail extends StatelessWidget {
  final User user;

  const UserDetail({
    Key? key,
    required this.user,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;  //width of the screen
    double height = MediaQuery.of(context).size.height;  //height of the screen
    final themeData = Theme.of(context);
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text(
            "Profilseite",
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                children: [
                  SizedBox(height: height * 0.1),
                  //frame for avatar picture
                  CircleAvatar(
                    backgroundColor: themeData.colorScheme.primary,
                    radius: width * 0.32,
                    //user avatar picture
                    child: CircleAvatar(
                        backgroundImage: NetworkImage(user.avatar),
                        radius: width * 0.3),
                  ),
                  SizedBox(
                    height: height * 0.04,
                  ),
                  //user details
                  Text(
                    user.fullname,
                    style: const TextStyle(
                        fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: height * 0.02,
                  ),
                  Text(user.email),
                ],
              ),
            ],
          ),
        ));
  }
}
