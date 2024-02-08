import 'package:flutter/material.dart';
import 'package:instagram_clone/colors.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;
import 'package:instagram_clone/feature/presentation/widget/button_widget.dart';
import 'dart:io';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({super.key});

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  String? username;
  String? bio;
  final ImagePicker _picker = ImagePicker();
  XFile? imageFile;
  FlutterSecureStorage storage = new FlutterSecureStorage();

  void pickImage() async {
    print('PickImage');
    final XFile? selectedImage =
        await _picker.pickImage(source: ImageSource.gallery);
    setState(() {
      imageFile = selectedImage;
    });
  }





  Future<void> upload_profile_picture() async {
    print("uploadFunction");
    String? token = await storage.read(key: 'token');
    print('edittoken$token');

    String? profile_uploadin_end_point =
        'http://10.0.2.2:8000/upload-profile-picture/';
        
    Uri uri = Uri.parse(profile_uploadin_end_point);
    var request = http.MultipartRequest('POST', uri);
    request.headers.addAll({
      'Authorization': 'Bearer $token',
    });
    // final file = File(imageFile!.path);
    // final asbyte = await file.readAsBytes();
    // final stream = Stream.value(asbyte);

    request.files.add(
        await http.MultipartFile.fromPath('profile_picture', imageFile!.path));
    request.send();

    // await request.headers.addAll({});
  }







  Future<void> update_profile(BuildContext context) async {
    String? update_endpoint = 'http://10.0.2.2:8000/update-profile/';
    Uri uri = Uri.parse(update_endpoint);
    String? token = await storage.read(key: 'token');
    print('token@edit$token');
    try {
      final response = await http.post(uri,
          headers: {'Authorization': 'Bearer $token'},
          body: {'username': username, 'bio': bio});
      if (response.statusCode == 200) {
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Profile updated Successfully')));
        Navigator.pop(context);

        //
      }
      if (response.statusCode == 409) {
        // print(409);
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text(
          'Username is already taken',
          style: TextStyle(color: Colors.red[700]),
        )));
      } else {
        print('statuscode@edit:${response.statusCode}');
        print('updatebody ${response.body}');
      }
    } catch (e) {
      print('error@updateprofile$e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        backgroundColor: backgroundColor,
        automaticallyImplyLeading: true,
        title: Text("Edit profile"),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: GestureDetector(
                  onTap: () {
                    showModalBottomSheet(
                        context: context,
                        builder: (BuildContext context) {
                          return Container(
                            height: 200,
                            child: ListTile(
                              leading: Icon(Icons.photo),
                              title: Text("New profile picture"),
                            ),
                          );
                        });
                  },
                  child: CircleAvatar(
                    backgroundImage: imageFile != null
                        ? FileImage(File(imageFile!.path))
                        : null,
                    radius: 40,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10.0),
              child: GestureDetector(
                onTap: () {
                  showModalBottomSheet(
                      context: context,
                      builder: (BuildContext context) {
                        return Container(
                          height: 100,
                          child: GestureDetector(
                            onTap: pickImage,
                            child: ListTile(
                              leading: Icon(Icons.photo),
                              title: Text("Choise Profile Picture"),
                            ),
                          ),
                        );
                      });
                },
                child: Container(
                  margin: EdgeInsets.only(left: 160),
                  child: Text(
                    "Edit picture",
                    style: TextStyle(
                        color: darkblueColor,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(40, 0, 0, 0),
              width: 350,
              child: TextField(
                style: TextStyle(color: primaryColor),
                onChanged: (value) {
                  username = value;
                  print('username$username');
                },
                decoration: InputDecoration(
                    focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: primaryColor)),
                    labelText: "Username",
                    labelStyle: TextStyle(color: primaryColor, fontSize: 15),
                    fillColor: Color.fromARGB(255, 255, 255, 255),
                    enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: primaryColor)),
                    hintStyle: TextStyle(color: Colors.white)),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              margin: EdgeInsets.fromLTRB(40, 0, 0, 0),
              width: 350,
              child: TextField(
                style: TextStyle(color: primaryColor),
                onChanged: (value) {
                  bio = value;
                  print('bio$bio');
                },
                decoration: InputDecoration(
                    focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: primaryColor)),
                    labelText: "Bio",
                    labelStyle: TextStyle(color: primaryColor, fontSize: 15),
                    fillColor: Colors.white,
                    enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: primaryColor)),
                    hintStyle: TextStyle(color: Colors.white)),
              ),
            ),
            verticalSpace(10),
            Container(
              margin: EdgeInsets.symmetric(vertical: 30, horizontal: 50),
              child: ButtonWidget(
                tapListner: () {
                  // upload_profile_picture();
                  update_profile(context);
                },
                color: blueColor,
                buttonText: "Done",
                borderRadius: BorderRadius.circular(20),
              ),
            )
          ],
        ),
      ),
    );
  }
}
