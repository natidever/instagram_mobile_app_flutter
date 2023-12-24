import 'package:flutter/material.dart';
import 'package:instagram_clone/colors.dart';
import 'package:instagram_clone/feature/presentation/pages/credential/singuppages/password.dart';
import 'package:instagram_clone/feature/presentation/pages/credential/singuppages/welcome.dart';
import 'package:instagram_clone/feature/presentation/widget/button_widget.dart';
import 'package:instagram_clone/feature/presentation/widget/form_widget.dart';

class EmailPage extends StatefulWidget {
  const EmailPage({
    super.key
    });

  @override
  State<EmailPage> createState() => _EmailPageState();
}

class _EmailPageState extends State<EmailPage> {
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
                  "Add email address",
                  style: TextStyle(
                    fontSize: 25,
                    fontFamily: 'Roboto',
                      color: primaryColor
                  ),
                ),
              ),
              
               verticalSpace(20),
               //you can  change it
              
             
               SizedBox(
                height: 40,
                 child: FormWidget(
                  
                  checkPassword: false,
                  hintText: "Email",

                 ),
               ),
               verticalSpace(20),

               ButtonWidget(
                tapListner: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>WelcomePage()));
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