import 'package:fkt42login/models/user.dart';
import 'package:fkt42login/pages/user_detail_page.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:fkt42login/themes.dart';

class UserList extends StatefulWidget {
  @override
  State<UserList> createState() => _UserListState();
}

class _UserListState extends State<UserList> {
  List<User> users = [];

  void initState() {
    loadUsers();
    super.initState();
  }

  void loadUsers() async {
    var uri = Uri.parse('https://reqres.in/api/users?page=2');
    final response = await http.get(uri);
    final responseData = json.decode(response.body);
    List<User> _users = [];
    for (var jsonUser in responseData['data']) {
      _users.add(User.fromJson(jsonUser));
    }
    setState(() {
      users = _users;
    });
  }

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    return ListView.builder(
      itemBuilder: (context, index) {
        return Card(
          child: ListTile(
            title: Text(
              users[index].fullname,
              style: themeData.textTheme.bodyText2,
            ),
            leading: CircleAvatar(
                backgroundImage: NetworkImage(users[index].avatar)),
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => UserDetail(
                        user: users[index],
                      )));
            },
          ),
        );
      },
      itemCount: users.length,
    );
  }
}
