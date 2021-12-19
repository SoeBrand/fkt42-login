import 'package:flutter/material.dart';
import 'package:fkt42login/themes.dart';

class CreatePasswordTextfield extends StatelessWidget {
  final TextEditingController passwordController;
  CreatePasswordTextfield({ Key? key, required this.passwordController }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    
    final themeData = Theme.of(context);
    return TextFormField(
                controller: passwordController,
                validator: (value){
                  if(value != null){
                    if(value.isEmpty){
                    return 'Bitte Passwort eingeben.';
                  }}
                },
                maxLength: 40,
                textAlign: TextAlign.left,
                textAlignVertical: TextAlignVertical.center,
                style: themeData.textTheme.bodyText1,
                obscureText: true,
                autocorrect: false,
                decoration: InputDecoration(
                  counterText: '',
                  hintText: 'Passwort', hintStyle: themeData.textTheme.bodyText1,
                  
                  prefixIcon: Icon(Icons.lock, color: themeData.colorScheme.onPrimary),
                  enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: themeData.colorScheme.onPrimary)),
                  focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: themeData.colorScheme.onPrimary)),
                ),
              );
  }
}