import 'package:fkt42login/pages/register_page.dart';
import 'package:fkt42login/widgets/textfield_password_register.dart';
import 'package:flutter/material.dart';

class CreatePasswordVal extends StatelessWidget {
  final TextEditingController passwordValidateController;
  final TextEditingController passwordController;
  const CreatePasswordVal(
      {Key? key,
      required this.passwordValidateController,
      required this.passwordController})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    return TextFormField(
      cursorColor: themeData.colorScheme.onPrimary,
      controller: passwordValidateController,
      validator: (value) {
        //validating if value is not null but empty
        if (value != null) {
          if (value.isEmpty) {
            return 'Passwort bestätigen';
          //validating if value is shorter than 6 characters
          } else {
            if (value.length < 6) {
              return 'Mindestens 6 Zeichen eingeben';
            }
          }
          //checking if both password fields have the same value
          if (passwordController.text != passwordValidateController.text) {
            return 'Passwörter stimmen nicht überein';
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
        hintText: 'Passwort bestätigen', 
        hintStyle: themeData.textTheme.bodyText1,
        prefixIcon: Icon(Icons.lock, color: themeData.colorScheme.onPrimary),
        //underline border when selected and not selected
        enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: themeData.colorScheme.onPrimary)),
        focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: themeData.colorScheme.onPrimary)),
      ),
    );
  }
}
