import 'package:flutter/material.dart';
import 'package:instagram_clone/colors.dart';
import 'package:instagram_clone/feature/presentation/pages/main_screen/search_page/widget/search_widget.dart';

import '../../../widget/form_widget.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}
        TextEditingController _controller=TextEditingController();
class _SearchPageState extends State<SearchPage> {

  // @override
  // void dispose() {
  //   // TODO: implement dispose
  //   super.dispose();
  //   _controller.dispose();
  // }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: backgroundColor,
        body: Padding(
          padding:  EdgeInsets.symmetric(horizontal: 20,vertical: 10),
          child: Column(
              children: [
                SearchWidget(controller: _controller),
                  verticalSpace(10),

                Expanded(
                  child: GridView.builder(
                    itemCount: 25,
                      physics: ScrollPhysics(),
                      shrinkWrap: true,
                      gridDelegate:SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3,
                          mainAxisSpacing: 1,
                          crossAxisSpacing:1,
                      ),
                      itemBuilder: (context,index){
                        return Container(
                          width: 70,
                          height: 50,
                          color: Colors.white70,
                        );
                      }
                  ),
                )
              ],
          ),
        ),
      ),
    );
  }
}
