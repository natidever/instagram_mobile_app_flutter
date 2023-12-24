import 'package:flutter/material.dart';
import 'package:instagram_clone/colors.dart';




class ButtonWidget extends StatelessWidget {
final String? buttonText;
final Color? color;
final VoidCallback?tapListner;
final Color ?borderColor;
final BorderRadius ? borderRadius;

  const ButtonWidget({
    super.key,
    this.buttonText,
    this.color,
    this.tapListner,
    this.borderColor,
    this.borderRadius,

    });


  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: tapListner,
      child: Container(
        width: double.infinity,
        height: 35,
        
        decoration: BoxDecoration(
          border: Border.all(
            color: borderColor??color??Colors.grey,
            width: 2,

          ),
          color: color,
          borderRadius: borderRadius,
        ),
        child: Center(child: Text(
          '$buttonText',
          style:TextStyle(
             color: textColor,
          ),
          
          )
          ),
      ),
    );
  }
}