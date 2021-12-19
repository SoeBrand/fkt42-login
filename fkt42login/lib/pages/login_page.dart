import 'package:fkt42login/utils.dart';
import 'package:fkt42login/themes.dart';
import 'package:fkt42login/widgets/button.dart';
import 'package:fkt42login/widgets/textfield_password.dart';
import 'package:fkt42login/widgets/textfield_email.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
//import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'dart:convert';

class LoginPage extends StatelessWidget {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    final themeData = Theme.of(context);

    return Scaffold(
      backgroundColor: themeData.colorScheme.primary,
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(left: width * 0.15, right: width * 0.15),
            child: Column(
              children: [
                SizedBox(
                  height: height * 0.4,
                ),
                createEmailTextfield(emailController: emailController),
                SizedBox(height: height * 0.05),
                CreatePasswordTextfield(passwordController: passwordController),
                SizedBox(
                  height: height * 0.07,
                ),
                CreateButton(
                  text: "Anmelden",
                  color: themeData.colorScheme.onPrimary,
                  onPressed: () async {
                    if (!_formKey.currentState!.validate()) {
                      return;
                    }
                    print(emailController.text);
                    print(passwordController.text);
                    bool validLogin = await Login.loginUser(
                        emailController.text, passwordController.text);

                    if (validLogin) {
                      Navigator.of(context).pushReplacementNamed('/userlist');
                    } else {
                      showDialog(
                          context: context,
                          builder: (context) {
                            return const AlertDialog(
                              content: Text('Login ist fehlgeschlagen.'),
                            );
                          });
                    }
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class UserData {
  final String email;

  UserData({required this.email});

  factory UserData.fromJson(Map<String, dynamic> json) {
    return UserData(email: json['email']);
  }
}

class Login {
  static Future<bool> loginUser(String email, String password) async {
    String basicAuth = 'Basic ' + base64Encode(utf8.encode('test:W!_FjnC_V4'));
    var uri = Uri.parse('https://reqres.in/api/login');

    final response = await http.post(
      uri,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'authorization': basicAuth,
      },
      body: jsonEncode(<String, String>{
        'email': email,
        'password': password,
      }),
    );
    if (response.statusCode == 200) {
      return true;
      /*
      final storage = new FlutterSecureStorage();
      await storage.write(key: "email", value: email);
      await storage.write(key: "password", value: password);
      return true;
    } else {
      return false;
    }*/

    }
    return false;
  }
}
