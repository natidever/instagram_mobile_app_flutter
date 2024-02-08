import 'package:flutter/material.dart';
// import 'package:instagram_clone/feature/presentation/pages/main_screen/main_screen.dart';

import 'feature/presentation/pages/credential/sign_in_page.dart';
import 'feature/presentation/pages/credential/singuppages/username.dart';
import 'feature/presentation/pages/main_screen/home_page/home_page.dart';
import 'package:instagram_clone/interceptor.dart';
import 'package:get/get.dart';
import 'package:instagram_clone/feature/services/constantAPIcalls.dart';

import 'package:dio/dio.dart';
// import 'package:instagram_clone/feature/presentation/pages/sign_in_page.dart';

void main() {

//Registering API
  Get.put(ConstantAPICalls());


  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // final Dio dio;

  MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      darkTheme: ThemeData.dark(),
      title: "Instagram clone",
      home: SignInPage(),
    );
  }
}
