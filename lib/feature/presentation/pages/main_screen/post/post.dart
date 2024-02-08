import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class PostPage extends StatefulWidget {
  const PostPage({super.key});

  @override
  State<PostPage> createState() => _PostPageState();
}

class _PostPageState extends State<PostPage> {
  FlutterSecureStorage storage = new FlutterSecureStorage();
  final ImagePicker _picker = ImagePicker();
  XFile? imageFile;

  void pickImage() async {
    print('PickImage');
    final XFile? selectedImage =
        await _picker.pickImage(source: ImageSource.gallery);
    setState(() {
      imageFile = selectedImage;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
          child: IconButton(
        icon: Icon(
          Icons.add_a_photo_rounded,
          size: 50,
          color: Colors.white,
        ),
        onPressed: () {
          pickImage();
          upload_post();
        },
      )),
    );
  }

  Future<void> upload_post() async {
    String post_end_point = "http://10.0.2.2:8000/post/";
    Uri uri = Uri.parse(post_end_point);
    var request = http.MultipartRequest('POST', uri);
    String? token = await storage.read(key: 'token');
    print('posttoken$token');
    request.headers.addAll({
      'Authorization': 'Bearer $token',
    });
    request.files
        .add(await http.MultipartFile.fromPath('posted_imge', imageFile!.path));

    request.send();
  }
}
