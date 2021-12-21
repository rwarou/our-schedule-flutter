import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:our_schedule/pages/dash_board.dart';

import 'pages/home.dart';
import 'pages/users/register.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      getPages: [
        GetPage(name: '/', page: () => Home()),
        GetPage(name: '/users/register', page: () => Register()),
        GetPage(name: '/dashboard', page: () => Dashboard()),
      ],
    );
  }
}
