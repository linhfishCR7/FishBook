/*
 User: Ha Van Linh
 Date: 12/04/2021
 Time: 06:27 PM
 */

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'pages/home.dart';
import 'package:google_sign_in/google_sign_in.dart';
//khai báo biến đăng ký tài khoản thông qua xác thực của email của gg
final GoogleSignIn googleSignIn = GoogleSignIn();

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  //lấy thời gian thực
  Firestore.instance.settings(timestampsInSnapshotsEnabled: true).then((_) {
    //print("Timestamps enabled in snapshots\n");
  }, onError: (_) {
    //print("Error enabling timestamps in snapshots\n");
  });
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FishBook',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.deepPurple,
        accentColor: Colors.teal,
      ),
      home: Home(),
      //Hiển thị lỗi render khi ảnh có gì đó lỗi
      builder: (BuildContext context, Widget widget) {
        Widget error = Text('...rendering error...');
        if (widget is Scaffold || widget is Navigator)
          error = Scaffold(body: Center(child: error));
        ErrorWidget.builder = (FlutterErrorDetails errorDetails) => error;
        return widget;
      },
    );
  }
}
