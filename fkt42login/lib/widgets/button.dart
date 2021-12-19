import 'package:flutter/material.dart';
import 'package:fkt42login/themes.dart';

class CreateButton extends StatelessWidget {
  
  final Function onPressed;
  final String text;
  final Color color;
  const CreateButton({ Key? key, required this.onPressed, required this.text, required this.color,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    final themeData = Theme.of(context);
    return InkWell(
      onTap: () => {onPressed()},
      child: Material(
        elevation: 16,
        borderRadius: BorderRadius.circular(8),
        child: Container(
          height: height*0.05,
          width: width*0.4,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8), 
            color: color),
          child: Center(
            child: Text(text,
            style: themeData.textTheme.button),
          )
        
          ),

        ),
      );
  }
}