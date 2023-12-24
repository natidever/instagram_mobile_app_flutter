import 'package:flutter/material.dart';
import 'package:instagram_clone/colors.dart';

class SearchWidget extends StatelessWidget {
  final TextEditingController controller;
  const SearchWidget({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return  Container(
      width: double.infinity,
      height: 40,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: secondaryColor.withOpacity(0.3)
      ),
      child: TextFormField(
        controller: controller,
    style: TextStyle(color: primaryColor),
    decoration:InputDecoration(
      border: InputBorder.none,
      prefixIcon: Icon(Icons.search,color: primaryColor),
      hintText: 'Search',
      hintStyle:TextStyle(color: primaryColor)

    ),
      ),
    );
  }
}
