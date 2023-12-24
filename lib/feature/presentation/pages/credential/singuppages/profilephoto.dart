import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:instagram_clone/colors.dart';
import 'package:instagram_clone/feature/presentation/pages/main_screen/main_screen.dart';
import 'package:instagram_clone/feature/presentation/widget/button_widget.dart';
import 'package:instagram_clone/feature/presentation/widget/customtextbutton.dart';

class ProfilePicturePage extends StatelessWidget {
  const ProfilePicturePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              // crossAxisAlignment:CrossAxisAlignment.center,
              children: [
                  Image.asset('assets/addingprofile2.jpeg',
                  width: 80,
                  ),
                  verticalSpace(50),
                  Text(
                    "Add profile photo",
                    style: TextStyle(
                      fontSize: 20,
                      fontFamily: "Roboto-Bolde",
                      letterSpacing: 0.5,
                        color: primaryColor

                    ),

                    
                  ),
                  verticalSpace(5),

                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal:1.0,vertical: 9),
                    child: Text(
                      
                      'Add profile photo so that your friends know it\'s you',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        letterSpacing: 1,
                        height: 1.5,
                        color: const Color.fromARGB(170, 255, 255, 255)
                      ),
                    ),
                  ),
                  verticalSpace(65),
                  ButtonWidget(
                    tapListner: (){},
                    buttonText: 'Add a photo',
                    color: blueColor,
                    borderRadius: BorderRadius.circular(4),
                  ),
                    verticalSpace(20),
                    TextButton(
                      onPressed: (){},
                       child: TextButton(
                        onPressed: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>MainPage()));
                        },
                         child: Text(
                            'Skip',
                            style: TextStyle(
                              color: darkblueColor,
                              fontFamily: 'Roboto-Bold'
                            ),
                         ),
                       ),
                    )
                    // CustomTextButton(
                    //   onPressedAction: (){},
                    //   CustomTextString: "Skip",
                    //   color: darkblueColor,
                      
                    // )

                  
                  
              
            ]),
          ),
        ),
      ),
    );
  }
}