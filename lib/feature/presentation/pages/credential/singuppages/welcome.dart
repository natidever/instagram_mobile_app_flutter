import 'package:flutter/material.dart';
import 'package:instagram_clone/colors.dart';
import 'package:instagram_clone/feature/presentation/pages/credential/singuppages/email.dart';
import 'package:instagram_clone/feature/presentation/pages/credential/singuppages/profilephoto.dart';

import 'package:instagram_clone/feature/presentation/widget/button_widget.dart';
import 'package:instagram_clone/feature/presentation/widget/customtextbutton.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Container(
          margin: EdgeInsets.only(top: 100),
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            // crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
               Center(
                 child: Image.asset(
                       'assets/welcomeimage.jpg',
                       width:150,
                       ),
               ),
               Text(
                'Welcome to instagram ,Natnael',
                textAlign: TextAlign.center,
                style: TextStyle(
                  // fontWeight: FontWeight.BOLD
                  fontSize: 22,
                  fontFamily: 'Roboto',
                    color: primaryColor

                   
                  // fontSize: 
                ),
               ),
               verticalSpace(20),
               ButtonWidget(
                tapListner: (){
                  Navigator.push(context, MaterialPageRoute(builder: ((context) => ProfilePicturePage())
                  )
                  );
                },
                buttonText: 'Complete Sign up',
                color: blueColor,
                borderRadius: BorderRadius.circular(4), 
               ),
               Flexible(
                child: Container(),
                flex:2,
               ),
               Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                    // Text(
                    //   'See  ',
                    //   style: TextStyle(
                    //     color: Color.fromARGB(215, 231, 227, 227),
                        
                    //   ),
                      
                    //   ),
                    // Text(
                    //   'Privacy Policy ,Cookies, Terms',
                    //    style: TextStyle(
                    //     color: Color.fromARGB(215, 231, 227, 227),
                    //     fontFamily: 'Roboto-bold'
                    //   ),
                      
                    // )
                    Row(children: [
                      
                      CustomTextButton(
                        onPressedAction: (){},
                        CustomTextString: "Privacy",
                         color: textColor,
          
                      ),
                      CustomTextButton(
                        onPressedAction: (){},
                        CustomTextString: "Cookies",
                         color: textColor,
          
                      ),
                      CustomTextButton(
                        
                        onPressedAction: (){},
                        CustomTextString: "Privacy",
                         color: textColor,
                      ),
                      
                      
                      
          
                    ],)
                ],
               ),
              
            ],
              
              
          ),
        ),
      ),
    );
  }
}