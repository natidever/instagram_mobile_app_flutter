import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';
import 'package:instagram_clone/colors.dart';
import 'package:instagram_clone/feature/presentation/pages/credential/singuppages/username.dart';
import 'package:instagram_clone/feature/presentation/pages/main_screen/main_screen.dart';
import 'package:instagram_clone/feature/presentation/widget/button_widget.dart';
import 'package:instagram_clone/feature/presentation/widget/form_widget.dart';
import 'package:flutter_svg/svg.dart';
import 'package:http/http.dart' as http;
import 'package:http_client_helper/http_client_helper.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SignInPage extends StatefulWidget {
  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  String? username;
  String? password;
  final storage = new FlutterSecureStorage();

  Future<void> login() async {
    //SEND POST REQUEST WITH DATA CHECK THE STATUS CODE STAY IN THE PAGE OR REDIRECT
    String login_end_point = 'http://10.0.2.2:8000/login/';

    try {
      final response = await HttpClientHelper.post(
        Uri.parse(login_end_point),
        body: {'username': username, 'password': password},
      );
      if (response!.statusCode == 200) {
        await storage.write(key: 'username', value: username);
        await storage.write(key: 'password', value: password);
        await getToken();

        //Validation is successful
        Navigator.push(
            context, MaterialPageRoute(builder: ((context) => MainPage())));
      } else {
        print(response.statusCode);
        final Map<String, dynamic> error = jsonDecode(response.body);
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            duration: Duration(seconds: 15),
            content: Text(
              'Invalid username or password',
              style: TextStyle(
                color: Colors.red,
              ),
            )));
        print("loginerror:$error");
      }
    } catch (e) {
      print('error in login function:$e');
    }
  }

  Future<void> getToken() async {
    try {
      print('getToken starts');
      String? username = await storage.read(key: 'username');
      String? password = await storage.read(key: 'password');
      final tokenEndPoint = 'http://10.0.2.2:8000/api/token/';
      print('before request');
      final response = await HttpClientHelper.post(Uri.parse(tokenEndPoint),
              body: {'username': username, 'password': password})
          .timeout(Duration(seconds: 10));

      if (response!.statusCode == 200) {
        print('success');
        final token = jsonDecode(response.body)['access'];
        final refreshToken = jsonDecode(response.body)['refresh'];
        print('refreshtoken:$refreshToken');
        print('bodyy:${response.body}');
        await storage.write(key: 'token', value: token);
        await storage.write(key: 'refreshToken', value: refreshToken);

        String? checktoken = await storage.read(key: 'token');
        String? rchecktoken = await storage.read(key: 'refreshToken');
        print('storedrefreshtoken: $rchecktoken');

        print('checktoke:$checktoken');
      } else {
        print('statuscode ${response.statusCode}');
        throw Exception('TOKEN FUNCTION FAILED');
      }
    } on TimeoutException catch (e) {
      print('request time out  $e');
    } catch (e) {
      print('Error in request: $e');
    }
  }

  // Future<void> getRefreshToken() async {
  //   try {
  //     print('getToken starts');
  //     String? username = await storage.read(key: 'username');
  //     String? password = await storage.read(key: 'password');
  //     final tokenEndPoint = 'http://10.0.2.2:8000/api/token/refresh/';
  //     print('before request');
  //     final response = await HttpClientHelper.post(Uri.parse(tokenEndPoint),
  //             body: {'username': username, 'password': password})
  //         .timeout(Duration(seconds: 10));

  //     if (response!.statusCode == 200) {
  //       final refreshToken = jsonDecode(response.body)['refresh'];
  //       print('refreshbodyy:${response.body}');
  //       await storage.write(key: 'refreshToken', value: refreshToken);
  //       String? checktoken = await storage.read(key: 'refreshToken');
  //       print('refreshtoken:$checktoken');
  //     } else {
  //       print('statuscode ${response.statusCode}');
  //       throw Exception('TOKEN refresh FUNCTION FAILED');
  //     }
  //   } on TimeoutException catch (e) {
  //     print('request time out  $e');
  //   } catch (e) {
  //     print('Error in request: $e');
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        backgroundColor: backgroundColor,
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10),
            child: Container(
              height: 600,
              width: 600,
              margin: EdgeInsets.symmetric(horizontal: 0, vertical: 50),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  //logo
                  Image.asset(
                    'assets/finallogo2.png',
                    width: 50,
                  ),

                  verticalSpace(110),

                  //form

                  SizedBox(
                    height: 40,
                    child: FormWidget(
                      onChanged: (value) {
                        setState(() {
                          username = value;
                          print('username$username');
                        });
                      },
                      hintText: 'username',
                      checkPassword: false,
                    ),
                  ),
                  verticalSpace(10),

                  SizedBox(
                    height: 40,
                    child: FormWidget(
                      onChanged: (value) {
                        setState(() {
                          password = value;
                          print('password$password');
                        });
                      },
                      hintText: 'Password',
                      checkPassword: true,
                    ),
                  ),
                  verticalSpace(10),

                  verticalSpace(10),
                  //button
                  ButtonWidget(
                    color: blueColor,
                    buttonText: 'Sign in',
                    tapListner: login,
                    borderRadius: BorderRadius.circular(6),
                  ),
                  verticalSpace(10),
                  Text(
                    'Forgotten password?',
                    style: TextStyle(
                      color: textColor,
                    ),
                  ),
                  Flexible(
                    flex: 3,
                    child: Container(),
                  ),

                  ButtonWidget(
                    color: Colors.transparent,
                    buttonText: 'Create new account',
                    borderColor: Color.fromARGB(255, 17, 26, 161),
                    borderRadius: BorderRadius.circular(20),
                    tapListner: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => UsernamePage()));
                    },
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
