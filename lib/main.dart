import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'pages/home.dart';
import 'pages/users/login.dart';
import 'pages/users/register.dart';
import 'pages/dash_board.dart';
import 'pages/promise/add.dart';

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
        GetPage(name: '/users/login', page: () => Login()),
        GetPage(name: '/users/register', page: () => Register()),
        GetPage(name: '/dashboard', page: () => Dashboard()),
        GetPage(name: '/dashboard/add', page: () => Add()),
      ],
    );
  }
}
