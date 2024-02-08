import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:http_client_helper/http_client_helper.dart';
import 'package:instagram_clone/feature/services/constantAPIcalls.dart';
import '../../../../../colors.dart';
import 'package:cupertino_icons/cupertino_icons.dart';

import 'package:get/get.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

List<String> profilePicture = [
  "assets/1.jpg",
  "assets/2.jpg",
  "assets/4.jpg",
  "assets/4.jpg",
  "assets/5.jpg",
  "assets/6.jpg",
  "assets/7.jpg",
];

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: backgroundColor,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: backgroundColor,
          title: SvgPicture.asset(
            'assets/instagram_wordmark.svg',
            color: primaryColor,
            width: 60,
            height: 40,
          ),
          actions: [
            IconButton(onPressed: () {}, icon: Icon(Icons.favorite_border)),
            IconButton(onPressed: () {}, icon: Icon(Icons.send))
          ],
        ),
        body: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: FutureBuilder(
                future: Future.wait([
                  // Get.find<ConstantAPICalls>().getUserData(),
                  Get.find<ConstantAPICalls>().getUserData(),
                ]),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(child: Text('Loading...'));
                  }
                  print('homescreensnap-${snapshot.data}');
                  if (snapshot.hasError) {
                    print('error getuserdataAPI@HOMEPAGE ${snapshot.error}');
                    return Text('something went wrong');
                  }
                  return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: List.generate(7, (index) {
                              // Check if it is the first item in the list
                              if (index == 0) {
                                return Stack(children: [
                                  CircleAvatar(
                                    backgroundImage:
                                        AssetImage(profilePicture[4]),
                                    radius: 45,
                                  ),
                                  Positioned(
                                    right: 0,
                                    bottom: 0,
                                    child: Padding(
                                      padding: const EdgeInsets.all(4.0),
                                      child: Container(
                                        width: 35,
                                        height: 35,
                                        decoration: BoxDecoration(
                                          color: Colors.blue,
                                          shape: BoxShape.circle,
                                        ),
                                        // child: Center(
                                        //     child: IconButton(
                                        //   icon: Icon(Icons.add, color: Colors.white),
                                        //   onPressed: () {
                                        //     // Add your onPressed logic here
                                        //   },
                                        // )),

                                        child: Stack(
                                          children: [
                                            Positioned(
                                              left: 0,
                                              right: 5,
                                              bottom: 2,
                                              top: 0,
                                              child: IconButton(
                                                icon: Icon(Icons.add,
                                                    color: Colors.white),
                                                onPressed: () {
                                                  // Add your onPressed logic here
                                                },
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ]);
                              } else {
                                // Render a container with CircleAvatar for the other items
                                return Container(
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 9),
                                    child: CircleAvatar(
                                      radius: 45,
                                      backgroundImage: AssetImage(
                                          'assets/instagramgradient1.jpg'),
                                      child: CircleAvatar(
                                        backgroundImage:
                                            AssetImage(profilePicture[index]),
                                        radius: 42,
                                      ),
                                    ),
                                  ),
                                );
                              }
                            }),
                          ),
                        ),

                        verticalSpace(20),
                        Divider(
                          color: Colors.white70,
                          thickness: 0.2,
                        ),

                        //////sdf////////////(below the body)-==Body of hoemscreen ..................//////////////////

                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(left: 8.0),
                                  child: CircleAvatar(
                                    radius: 21,
                                    backgroundImage: AssetImage(
                                        'assets/instagramgradient1.jpg'),
                                    child: CircleAvatar(
                                      backgroundImage: NetworkImage(
                                        ''
                                        'http://10.0.2.2:8000${snapshot.data![0]['profile_picture']}',
                                      ),
                                      radius: 19,
                                    ),
                                  ),
                                ),
                                TextButton(
                                  onPressed: () {},
                                  child: Text(
                                    // 'username',
                                    snapshot.data![0]['user']['username'],
                                    style: TextStyle(
                                        color: primaryColor, fontSize: 15),
                                  ),
                                )
                              ],
                            ),
                            Icon(
                              Icons.more_vert,
                              color: primaryColor,
                            )
                          ],
                        ),
                        verticalSpace(5),
                        Container(
                          width: double.infinity,
                          height: MediaQuery.of(context).size.height * 0.7,
                          color: Colors.white24,
                        ),
                        verticalSpace(5),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Icon(
                                  Icons.favorite_border_rounded,
                                  color: primaryColor,
                                  size: 33,
                                ),
                                SizedBox(width: 10),
                                Icon(
                                  Icons.favorite_border_rounded,
                                  color: primaryColor,
                                  size: 33,
                                ),
                                SizedBox(width: 10),
                                Icon(
                                  Icons.favorite_border_rounded,
                                  color: primaryColor,
                                  size: 33,
                                ),
                              ],
                            ),
                            Icon(
                              Icons.bookmark_border,
                              color: primaryColor,
                              size: 33,
                            )
                          ],
                        ),
                        verticalSpace(10),
                        Text(
                          '23,245 likes',
                          style: TextStyle(
                            color: primaryColor,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        verticalSpace(5),
                        Text(
                          'User name ',
                          style: TextStyle(
                            color: primaryColor,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        verticalSpace(5),
                        GestureDetector(
                          onTap: () {},
                          child: Text(
                            'View all 88 comment ',
                            style: TextStyle(
                              color: primaryColor,
                              fontSize: 16,
                            ),
                          ),
                        ),
                        verticalSpace(5),
                        Text(
                          '10 minute ago ',
                          style: TextStyle(
                            color: primaryColor,
                          ),
                        ),
                      ]);
                })));
  }
}
