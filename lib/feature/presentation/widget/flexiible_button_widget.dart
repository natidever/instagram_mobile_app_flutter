import 'package:flutter/material.dart';
import 'package:instagram_clone/colors.dart';




class FlexibleButtonWidget extends StatelessWidget {
final String? buttonText;
final Color? color;
final VoidCallback?tapListner;
final Color ?borderColor;
final BorderRadius ? borderRadius;
final double ?width;
final FontWeight? fontWeight;
final double? fontSize;

  const FlexibleButtonWidget({
    super.key,
    this.buttonText,
    this.color,
    this.tapListner,
    this.borderColor,
    this.borderRadius,
    this.width,
    this.fontWeight,
    this.fontSize,

    });


  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: tapListner,
      child: Container(
        width: width,
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
            fontWeight: fontWeight,
            fontSize: fontSize,
          ),

          )
          ),
      ),
    );
  }
}