import 'package:flutter/material.dart';
import 'package:fkt42login/themes.dart';
import 'package:fkt42login/utils.dart';

class createEmailTextfield extends StatelessWidget {
  final TextEditingController emailController;
  createEmailTextfield({Key? key, required this.emailController})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    return TextFormField(
      controller: emailController,
      cursorColor: themeData.colorScheme.onPrimary,
      //validating if value is not null and if value is an email address
      validator: (value) {
        if (value == null) {
          return "Bitte eine gültige Email Adresse angeben.";
        }
        if (!Utils.isEmail(value)) {
          return "Bitte eine gültige Email Adresse angeben.";
        }
      },
      keyboardType: TextInputType.emailAddress,
      maxLength: 40,
      textAlign: TextAlign.left,
      textAlignVertical: TextAlignVertical.center,
      style: themeData.textTheme.bodyText1,
      decoration: InputDecoration(
        counterText: '',
        hintText: "Email",  
        hintStyle: themeData.textTheme.bodyText1,
        prefixIcon: Icon(Icons.email, color: themeData.colorScheme.onPrimary),
        //underline border when selected and not selected
        enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: themeData.colorScheme.onPrimary)),
        focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: themeData.colorScheme.onPrimary)),
      ),
    );
  }
}
