import 'dart:convert';

import 'package:get/get.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http_client_helper/http_client_helper.dart';




class ConstantAPICalls extends GetxService{

  final storage = new FlutterSecureStorage();

  Future<Map<String, dynamic>> getUserData() async {
    String? username = await storage.read(key: 'username');
    String? password = await storage.read(key: 'password');
    print('storedpassword:$password');
    print('storedusername:$username');
    String? token = await storage.read(key: 'token');
    print('usertoken:$token ');

    final String getUserDataEndPoint = 'http://10.0.2.2:8000/userdata/';
    final response = await HttpClientHelper.get(
      Uri.parse(getUserDataEndPoint),
      headers: {'Authorization': 'Bearer $token'},
    );
    if (response!.statusCode == 200) {
      var body = jsonDecode(response.body);

      // print('body:$body');
      // print('username:${body['user']['username']}')
      return body;
    } else {
      print('statuscode:${response.statusCode}');
      throw Exception('Failed to fetch userdata');
    }
  }  

}