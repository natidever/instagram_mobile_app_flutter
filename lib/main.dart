import 'package:flutter/material.dart';
// import 'package:instagram_clone/feature/presentation/pages/main_screen/main_screen.dart';

import 'feature/presentation/pages/credential/sign_in_page.dart';
import 'feature/presentation/pages/credential/singuppages/username.dart';
import 'feature/presentation/pages/main_screen/home_page/home_page.dart';
// import 'package:instagram_clone/feature/presentation/pages/sign_in_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      darkTheme: ThemeData.dark(),
      title: "Instagram clone",
      home: SignInPage(),
    );
  }
}
