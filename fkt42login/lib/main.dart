import 'package:fkt42login/pages/login_page.dart';
import 'package:fkt42login/themes.dart';
import 'package:fkt42login/pages/user_list_page.dart';
import 'package:flutter/material.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home:  LoginPage(),
      theme: AppTheme.lightTheme,

      routes: <String, WidgetBuilder>{
      "/login": (BuildContext context) => LoginPage(),
      "/userlist": (BuildContext context) => UserListPage(),}
    
    );}
}
