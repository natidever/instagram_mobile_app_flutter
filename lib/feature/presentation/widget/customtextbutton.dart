import 'package:flutter/material.dart';
class CustomTextButton extends StatelessWidget {
  
   CustomTextButton({
    super.key,  
    this.padding, 
    this.onPressedAction, 
    this.CustomTextString, 
    this.color});

final EdgeInsetsGeometry ?padding;
final VoidCallback?onPressedAction;
final String ? CustomTextString;
final Color? color;

  
  @override
  Widget build(BuildContext context) {
    
    return TextButton(
      style: TextButton.styleFrom(padding: EdgeInsets.zero),
      onPressed: onPressedAction,
      child: Text(
        '$CustomTextString',
        style: TextStyle(
          color: color,

        ),
      ),
    );
  }
}