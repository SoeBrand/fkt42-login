import 'package:flutter/material.dart';

class CreatePasswordReg extends StatelessWidget {
  final TextEditingController passwordController;
  const CreatePasswordReg({Key? key, required this.passwordController})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    return TextFormField(
        controller: passwordController,
        validator: (value) {
          if (value != null) {
            if (value.isEmpty || value.length < 6) {
              return 'Mindestens 6 Zeichen eingeben';
            }
          }
        },
        maxLength: 40,
        textAlign: TextAlign.left,
        textAlignVertical: TextAlignVertical.center,
        style: themeData.textTheme.bodyText1,
        obscureText: true,
        enableSuggestions: false,
        autocorrect: false,
        decoration: InputDecoration(
          counterText: '',
          hintText: 'Passwort',
          hintStyle: themeData.textTheme.bodyText1,
          prefixIcon: Icon(Icons.lock, color: themeData.colorScheme.onPrimary),
          enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: themeData.colorScheme.onPrimary)),
          focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: themeData.colorScheme.onPrimary)),
        ));
  }
}


