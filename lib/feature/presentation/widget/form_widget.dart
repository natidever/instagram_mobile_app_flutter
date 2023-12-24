import 'package:flutter/material.dart';
import 'package:instagram_clone/colors.dart';

class FormWidget extends StatefulWidget {
  final String? hintText;

  final String? labelText;
  final TextEditingController? controller;
  final Function(String)? onChanged;
  final bool? checkPassword; //for isPassword

  bool obscureText = true;

  FormWidget(
      {this.hintText,
      this.checkPassword,
      this.controller,
      this.labelText,
      this.onChanged});

  @override
  State<FormWidget> createState() => _FormWidgetState();
}
//  bool checkEmpty=false;

class _FormWidgetState extends State<FormWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
          color: secondaryColor.withOpacity(.35),
          borderRadius: BorderRadius.circular(5)),
      child: TextFormField(
        // onChanged: (value) {

        //     setState(() {
        //      checkEmpty=value.isNotEmpty;

        //     });

        // },
        style: TextStyle(color: Colors.white),
        onChanged: widget.onChanged,
        obscureText: widget.checkPassword == true ? widget.obscureText : false,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
          hintText: widget.hintText,
          border: InputBorder.none,
          hintStyle: TextStyle(
            color: secondaryColor,
            fontSize: 13,
          ),
          suffixIcon: IconButton(
              onPressed: () {
                setState(() {
                  widget.obscureText = !widget.obscureText;
                });
              },
              icon: widget.checkPassword == true
                  ? Icon(
                      widget.obscureText
                          ? Icons.visibility
                          : Icons.visibility_off,
                      color: Colors.blueAccent,
                    )
                  : Text('')),
        ),
      ),
    );
  }
}
