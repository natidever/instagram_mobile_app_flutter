import 'dart:convert';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:instagram_clone/colors.dart';
import 'package:instagram_clone/feature/presentation/pages/main_screen/profile/editprofile.dart';
import 'package:http/http.dart' as http;
import 'package:http_client_helper/http_client_helper.dart';
import 'package:instagram_clone/feature/services/constantAPIcalls.dart';
import 'package:instagram_clone/feature/services/model.dart';
import '../../../widget/button_widget.dart';
import '../../../widget/flexiible_button_widget.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage>
    with TickerProviderStateMixin {
  void initState() {
    // _tabController = new TabController(length: 2, vsync: this);
    super.initState();
    //  etUserData();
    // getUserData();
  }

  final storage = new FlutterSecureStorage();

  // Future<Map<String, dynamic>> getUserData() async {
  //   String? username = await storage.read(key: 'username');
  //   String? password = await storage.read(key: 'password');
  //   print('storedpassword:$password');
  //   print('storedusername:$username');
  //   String? token = await storage.read(key: 'token');
  //   print('usertoken:$token ');

  //   final String getUserDataEndPoint = 'http://10.0.2.2:8000/userdata/';
  //   final response = await HttpClientHelper.get(
  //     Uri.parse(getUserDataEndPoint),
  //     headers: {'Authorization': 'Bearer $token'},
  //   );
  //   if (response!.statusCode == 200) {
  //     var body = jsonDecode(response.body);

  //     // print('body:$body');
  //     // print('username:${body['user']['username']}')
  //     return body;
  //   } else {
  //     print('statuscode:${response.statusCode}');
  //     throw Exception('Failed to fetch userdata');
  //   }
  // }

  Future<List<dynamic>> getUserPosts() async {
    String userPostEndPoint = "http://10.0.2.2:8000/postedImage/";
    Uri uri = Uri.parse(userPostEndPoint);
    String? token = await storage.read(key: 'token');

    var request = await http.get(uri, headers: {
      'Authorization': 'Bearer $token',
    });

    if (request.statusCode == 200) {
      var body = jsonDecode(request.body);
      return body;
    } else {
      print('error user on user post ${request.statusCode}');
      throw Exception('failed to fetch');
    }
  }

  _bottomhseet(BuildContext context) {
    return showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return Container(
            child: Text("data",
                style: TextStyle(
                  color: primaryColor,
                )),
          );
        });
  }

  String profilePictureUrl = 'http://10.0.2.2:8000';
  String? userbio;
  Widget build(BuildContext context) {
    TabController _tabController = new TabController(length: 3, vsync: this);

    return FutureBuilder(
        // future: getUserData(),
        future: Get.find<ConstantAPICalls>().getUserData(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: Text('loading..'),
            );
          } else if (snapshot.hasError) {
            print('Error:${snapshot.error}');
            return Text('Connection error');
          } else {
            userbio = snapshot.data!['bio'];
            return Scaffold(
              backgroundColor: backgroundColor,
              appBar: AppBar(
                automaticallyImplyLeading: true,
                backgroundColor: backgroundColor,
                title: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "${snapshot.data!['user']['username']}",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 22,
                    ),
                  ),
                ),
                actions: [
                  Padding(
                    padding: const EdgeInsets.only(right: 15.0),
                    child: Icon(
                      Icons.add,
                      size: 25,
                    ),
                  ),

                  // Container(
                  //   width: 100,
                  //   child: Padding(
                  //     padding: EdgeInsets.symmetric(horizontal: 20),
                  //     child: InkWell(onTap: () {
                  //       if (mounted) {
                  //         setState(() {
                  //           _bottomhseet(context);
                  //         });
                  //       }
                  //     }),
                  //   ),
                  // ),
                  Padding(
                    padding: const EdgeInsets.only(right: 30.0),
                    child: IconButton(
                        onPressed: () {
                          showModalBottomSheet(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.vertical(
                                top: Radius.circular(20),
                              )),
                              backgroundColor: Color.fromRGBO(59, 60, 54, 1),
                              // backgroundColor: darkGreyColor,
                              context: context,
                              builder: (BuildContext context) {
                                return Container(
                                    height: 300,
                                    // decoration: BoxDecoration(color: Colors.grey),
                                    child: Column(
                                      children: [
                                        ListTile(
                                          minLeadingWidth: 10,
                                          horizontalTitleGap: 10,
                                          textColor: Colors.white,
                                          iconColor: Colors.white,
                                          leading: Icon(Icons.settings_rounded),
                                          title: Text("Setting and privacy"),
                                        ),
                                        ListTile(
                                          minLeadingWidth: 10,
                                          horizontalTitleGap: 10,
                                          textColor: Colors.white,
                                          iconColor: Colors.white,
                                          leading: Icon(Icons.local_activity),
                                          title: Text("Your activity"),
                                        ),
                                        ListTile(
                                          minLeadingWidth: 10,
                                          horizontalTitleGap: 10,
                                          textColor: Colors.white,
                                          iconColor: Colors.white,
                                          leading: Icon(
                                              Icons.qr_code_scanner_outlined),
                                          title: Text("QR code"),
                                        ),
                                        ListTile(
                                          minLeadingWidth: 10,
                                          horizontalTitleGap: 10,
                                          textColor: Colors.white,
                                          iconColor: Colors.white,
                                          leading: Icon(Icons.family_restroom),
                                          title: Text("Close friends"),
                                        ),
                                        ListTile(
                                          minLeadingWidth: 10,
                                          horizontalTitleGap: 10,
                                          textColor: Colors.white,
                                          iconColor: Colors.white,
                                          leading: Icon(Icons.star),
                                          title: Text("Favorites"),
                                        ),
                                      ],
                                    ));
                              });
                        },
                        icon: Icon(
                          Icons.menu,
                          color: primaryColor,
                          size: 30,
                        )),
                  )
                ],
              ),
              body: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 25, vertical: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Column(
                          children: [
                            CircleAvatar(
                              radius: 42,
                              // backgroundImage: AssetImage('assets/4.jpg'),
                              backgroundImage: NetworkImage(
                                  '$profilePictureUrl${snapshot.data!['profile_picture']}'),
                            ),
                            verticalSpace(10),
                            Text(
                              "${snapshot.data!['user']['username']}",
                              style: TextStyle(
                                color: primaryColor,
                                fontWeight: FontWeight.bold,
                                fontSize: 15,
                              ),
                            ),
                            Text(
                              userbio ?? '',
                              style: TextStyle(color: primaryColor),
                            )
                          ],
                        ),
                        horizontalSpace(50),
                        Column(
                          children: [
                            Text(
                              "5",
                              style: TextStyle(
                                color: primaryColor,
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                              ),
                            ),
                            verticalSpace(15),
                            Text(
                              "Post",
                              style: TextStyle(
                                color: primaryColor,
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                              ),
                            )
                          ],
                        ),
                        horizontalSpace(10),
                        Column(
                          children: [
                            Text(
                              "200",
                              style: TextStyle(
                                color: primaryColor,
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                              ),
                            ),
                            verticalSpace(15),
                            Text(
                              "Follower",
                              style: TextStyle(
                                color: primaryColor,
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                              ),
                            )
                          ],
                        ),
                        horizontalSpace(5),
                        Column(
                          children: [
                            Text(
                              "1234",
                              style: TextStyle(
                                color: primaryColor,
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                              ),
                            ),
                            verticalSpace(15),
                            Text(
                              "Following",
                              style: TextStyle(
                                color: primaryColor,
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),

                  verticalSpace(10),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        FlexibleButtonWidget(
                          color: Colors.white12,
                          buttonText: "Edit profile",
                          borderRadius: BorderRadius.circular(10),
                          width: 170,
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                          tapListner: () async {
                            await Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => EditProfile()));

                            setState(() {});
                          },
                        ),
                        FlexibleButtonWidget(
                          color: Colors.white12,
                          buttonText: "Share profile",
                          borderRadius: BorderRadius.circular(10),
                          width: 170,
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                        ),
                      ],
                    ),
                  ),
                  verticalSpace(10),

                  //Tagged page will be added using tab view if we're going to add tagging functionality
                  //  GridView.builder(
                  //    itemCount: 10,
                  //      physics: ScrollPhysics(),
                  //      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  //          crossAxisCount: 3,
                  //          crossAxisSpacing: 1,
                  //          mainAxisSpacing: 1),
                  //      itemBuilder: (context,index){
                  //        return Container(
                  //          width: 70,
                  //          height:50,
                  //          color:Colors.white60,
                  //        );
                  //
                  //      }
                  //  )

                  Container(
                    height: 50,
                    width: double.maxFinite,
                    child: TabBar(controller: _tabController, tabs: <Widget>[
                      Tab(
                        icon: Icon(
                          Icons.grid_4x4_outlined,
                          // color: Colors.red,
                        ),
                      ),
                      Tab(
                        icon: Icon(
                          Icons.video_library_sharp,
                          // color: const Color.fromARGB(255, 63, 60, 60),
                        ),
                      ),
                      Tab(
                        icon: Icon(
                          Icons.contacts_rounded,
                          // color: const Color.fromARGB(255, 63, 60, 60),
                        ),
                      )
                    ]),
                  ),
                  Expanded(
                    child: Container(
                      child: TabBarView(controller: _tabController, children: [
                        FutureBuilder(
                            future: getUserPosts(),
                            builder: ((context, snapshot) {
                              if (snapshot.connectionState ==
                                  ConnectionState.waiting) {
                                return Text(
                                  "Loading..",
                                  style: TextStyle(color: Colors.white),
                                );
                              } else if (snapshot.hasData) {
                                print('data${snapshot.data}');

                                List<dynamic> data = snapshot.data ?? [];
                                List<Post> posts = data
                                    .map((item) => Post.fromJson(item))
                                    .toList();
                                String baseAddress = 'http://10.0.2.2:8000';

                                return GridView.builder(
                                    itemCount: posts.length,
                                    gridDelegate:
                                        SliverGridDelegateWithFixedCrossAxisCount(
                                            crossAxisCount: 3,
                                            crossAxisSpacing: 2,
                                            mainAxisSpacing: 2),
                                    itemBuilder: (context, index) {
                                      final post = posts[index];
                                      return Container(
                                          width: 100,
                                          height: 200,
                                          child: Image.network(errorBuilder:
                                              (context, error, stackTrace) {
                                            return Text('failed to load image');
                                          }, '$baseAddress${post.postedImage}'));
                                    });
                              } else if (snapshot.hasError) {
                                print("gettingposterror-${snapshot.error}");
                                return Text('error');
                              } else {
                                return Text('else blcokc');
                              }
                            })),
                        Center(
                          child: Text("SECOND"),
                        ),
                        Text("data"),
                      ]),
                    ),
                  )
                  // Padding(
                  //   padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  //   child: Text(
                  //     "Your posts",
                  //     style:
                  //         TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                  //   ),
                  // ),
                  // verticalSpace(10),

                  // Expanded(
                  //   child: GridView.builder(
                  //       itemCount: 49,
                  //       shrinkWrap: true,
                  //       physics: ScrollPhysics(),
                  //       gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  //         crossAxisCount: 3,
                  //         mainAxisSpacing: 1,
                  //         crossAxisSpacing: 1,
                  //       ),
                  //       itemBuilder: (context, index) {
                  //         return Container(
                  //           width: 40,
                  //           height: 40,
                  //           color: Colors.white60,
                  //         );
                  //       }),
                  // )
                ],
              ),
            );
          }
        });
  }
}
