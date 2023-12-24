import 'package:flutter/material.dart';
import 'package:instagram_clone/colors.dart';
import 'package:instagram_clone/feature/presentation/pages/credential/singuppages/email.dart';
import 'package:instagram_clone/feature/presentation/widget/button_widget.dart';
import 'package:instagram_clone/feature/presentation/widget/form_widget.dart';

class PasswordPage extends StatefulWidget {
  const PasswordPage({super.key});

  @override
  State<PasswordPage> createState() => _PasswordPageState();
}

class _PasswordPageState extends State<PasswordPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
             children: <Widget>[
              //chose user name
              Container(
                alignment: Alignment.center,
                child: Text(
                  "Create a password",
                  style: TextStyle(
                    fontSize: 25,
                      color: primaryColor

                  ),
                ),
              ),
              
               verticalSpace(20),
               //you can  change it
              
               Padding(
                 padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 0),
                 child: Text(
                               
                  "For security,your password must be six or more character",
                  style: TextStyle(
                    color: Colors.white70,
                    fontSize: 14,
                    letterSpacing:0.2  ,
                  ),
                   textAlign:TextAlign.center,

                 ),
               ),
               verticalSpace(30),
               //Textfield
               SizedBox(
                height: 40,
                 child: FormWidget(
                  
                  checkPassword: true,
                  hintText: "Password",

                 ),
               ),
               
               
               verticalSpace(20),

               ButtonWidget(
                tapListner: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>EmailPage()));
                },
                color: blueColor,
                buttonText: "Next",
                borderRadius: BorderRadius.circular(6),
               ),
               
             
             ],
          
          ),
        ),
      ),
    );
  }
}