import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:instagram_clone/colors.dart';
import 'package:instagram_clone/feature/presentation/pages/main_screen/profile/profile_page.dart';
import 'package:instagram_clone/feature/presentation/pages/main_screen/search_page/search.dart';

import 'home_page/home_page.dart';

class MainPage extends StatefulWidget {

  @override
  State<MainPage> createState() => _MainPageState();
}



 

   



class _MainPageState extends State<MainPage> {

    int _currentPage=0;
   late PageController pageController;

  @override
  void initState() {
    pageController=PageController();
    super.initState();
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }


void goTo(int index){
  pageController.jumpToPage(index);
}

 void onPageChange(int index){
   _currentPage=index;
 }



  @override
  Widget build(BuildContext context) {
    
    return SafeArea(
      child: Scaffold(
        backgroundColor:backgroundColor,
        bottomNavigationBar: CupertinoTabBar(
          backgroundColor: backgroundColor,
          onTap: goTo,
          items: [
    
                 BottomNavigationBarItem(icon: Icon(Icons.home_filled,color: primaryColor,),label: ""),
                 BottomNavigationBarItem(icon: Icon(Icons.search,color: primaryColor,),label: ""),
                 BottomNavigationBarItem(icon: Icon(Icons.add_circle,color: primaryColor,),label: ""),
                 BottomNavigationBarItem(icon: Icon(Icons.favorite,color: primaryColor,),label: ""),
                 BottomNavigationBarItem(icon: Icon(Icons.account_circle_outlined,color: primaryColor,),label: ""),
    
    
    
        ]),
        body: PageView(
          controller: pageController,
          onPageChanged: onPageChange,
          children: [
            HomePage(),
            SearchPage(),
            Center(child: Text("Post",style: TextStyle(color: primaryColor),),),
            Center(child: Text("Activity",style: TextStyle(color: primaryColor),),),
            ProfilePage(),
    
          
        ]),
    
          
        
        
      ),
    );
  }
}