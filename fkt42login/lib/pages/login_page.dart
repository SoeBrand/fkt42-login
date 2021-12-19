import 'package:fkt42login/utils.dart';
import 'package:fkt42login/themes.dart';
import 'package:fkt42login/widgets/button.dart';
import 'package:fkt42login/widgets/textfield_password_login.dart';
import 'package:fkt42login/widgets/textfield_email.dart';
import 'package:fkt42login/pages/register_page.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:fkt42login/themes.dart';

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
                  height: height * 0.35,
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
                    bool validLogin = await Login.loginUser(
                        emailController.text, passwordController.text);

                    if (validLogin) {
                      Navigator.of(context).pushNamedAndRemoveUntil('/userlist', (Route<dynamic> route) => false);
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
                ),
                SizedBox(
                  height: height*0.03,
                ),
                Center(
                  child: Text("Ich habe noch kein Konto", style: themeData.textTheme.bodyText1!.copyWith(fontSize: 14)),
                ),
                TextButton(onPressed: (){Navigator.of(context).pushNamed('/register');}, child: Text("Registrieren", style: themeData.textTheme.bodyText1!.copyWith(fontSize: 14, color: Colors.white)))
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
    }
    return false;
  }
}
