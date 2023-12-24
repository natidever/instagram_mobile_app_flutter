import 'package:flutter/material.dart';
import 'package:instagram_clone/colors.dart';
import 'package:instagram_clone/feature/presentation/pages/credential/singuppages/password.dart';
import 'package:instagram_clone/feature/presentation/pages/credential/singuppages/welcome.dart';
import 'package:instagram_clone/feature/presentation/widget/button_widget.dart';
import 'package:instagram_clone/feature/presentation/widget/form_widget.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:http_client_helper/http_client_helper.dart';

class UsernamePage extends StatefulWidget {
  const UsernamePage({super.key});

  @override
  State<UsernamePage> createState() => _UsernamePageState();
}

class _UsernamePageState extends State<UsernamePage> {
  String? username;
  String? password;
  String? email;
  Future<void> signUp() async {
    final String signUpEndPoint = 'http://10.0.2.2:8000/singup/';
    final response = await HttpClientHelper.post(Uri.parse(signUpEndPoint),
        body: {'username': username, 'password': password, 'email': email});
    if (response!.statusCode == 201) {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => WelcomePage()));
    } else {
      final Map<String, dynamic> responseBody = jsonDecode(response.body);
      // final Map<String, dynamic> error = responseBody['errors'];

      // print('validationerror $error');
      int statuscode = response.statusCode;
      print('statuscode $statuscode');

      final Iterable errorMessage = responseBody.values;
      // final String allerrors = errorMessage.join(',');
      final String allerrors = errorMessage.expand((i) => i).join(', ');

      print('errormessage $errorMessage');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          duration: Duration(seconds: 30),
          content: Text(
            allerrors,
            style: TextStyle(color: Colors.red),
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: SingleChildScrollView(
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                //chose user name
                SizedBox(
                  height: 100,
                ),
                Container(
                  alignment: Alignment.center,
                  child: Text(
                    "Enter your credentials",
                    style: TextStyle(
                        fontSize: 25,
                        fontFamily: 'Roboto',
                        color: primaryColor),
                  ),
                ),

                verticalSpace(20),
                //you can  change it

                Text(
                  "Password must be more than 6 digit",
                  style: TextStyle(
                    color: Colors.white70,
                    fontSize: 15,
                  ),
                ),
                verticalSpace(30),
                //Textfield
                SizedBox(
                  height: 40,
                  child: FormWidget(
                    onChanged: (value) {
                      setState(() {
                        username = value;
                        print('Username:$username');
                      });
                    },
                    checkPassword: false,
                    hintText: "Username",
                  ),
                ),
                verticalSpace(20),
                SizedBox(
                  height: 40,
                  child: FormWidget(
                    onChanged: (value) {
                      setState(() {
                        password = value;
                        print('Password:$password');
                      });
                    },
                    checkPassword: true,
                    hintText: "Password",
                  ),
                ),
                verticalSpace(20),
                SizedBox(
                  height: 40,
                  child: FormWidget(
                    onChanged: (value) {
                      setState(() {
                        email = value;
                        print('Email:$email');
                      });
                    },
                    checkPassword: false,
                    hintText: "Email",
                  ),
                ),
                verticalSpace(20),

                ButtonWidget(
                  tapListner: signUp,
                  color: blueColor,
                  buttonText: "Next",
                  borderRadius: BorderRadius.circular(6),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
