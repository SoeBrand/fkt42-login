import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:fkt42login/widgets/button.dart';
import 'package:fkt42login/widgets/textfield_email.dart';
import 'package:fkt42login/widgets/textfield_password_register.dart';
import 'package:fkt42login/widgets/textfield_password_validator.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatelessWidget {
  @override
  //textfiel controller
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final passwordValidateController = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  RegisterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width; //width of the screen
    double height = MediaQuery.of(context).size.height; //height of the screen
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
                  height: height * 0.25,
                ),
                createEmailTextfield(emailController: emailController),
                SizedBox(height: height * 0.05),
                //textfield password
                CreatePasswordReg(passwordController: passwordController),
                SizedBox(
                  height: height * 0.05,
                ),
                //textfield password validation
                CreatePasswordVal(
                  passwordValidateController: passwordValidateController,
                  passwordController: passwordController,
                ),
                SizedBox(
                  height: height * 0.07,
                ),
                CreateButton(
                    text: "Registrieren",
                    color: themeData.colorScheme.onPrimary,
                    onPressed: () async {
                      //validating the form
                      if (!_formKey.currentState!.validate()) {
                        return;
                      }
                      try {
                        //waiting for bool of registerUser
                        bool registration = await registerUser(
                            emailController.text,
                            passwordController.text,
                            context);
                        //register data valid --> register
                        if (registration) {
                          Navigator.of(context).pushNamed(
                            '/login',
                          );
                        }
                        //register data invalid --> catch error
                      } catch (err) {
                        print(err);
                      }
                    }),
                SizedBox(
                  height: height * 0.03,
                ),
                Center(
                  child: Text("Ich habe bereits ein Konto",
                      style: themeData.textTheme.bodyText1!
                          .copyWith(fontSize: 14)),
                ),
                //redirecting to LoginPage
                TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: Text("Login",
                        style: themeData.textTheme.bodyText1!
                            .copyWith(fontSize: 14, color: Colors.white)))
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Future<bool> registerUser(
    String email, String password, BuildContext context) async {
  //parsing the request url into a new url
  var uri = Uri.parse('https://reqres.in/api/register');

  //sending post-request to api
  final response = await http.post(
    uri,
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, String>{
      'email': email,
      'password': password,
    }),
  );
  //if registration is valid --> return true
  if (response.statusCode == 200) {
    print("registration successful.");
    return true;
  }
  return false;
}
