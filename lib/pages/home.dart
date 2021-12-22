import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:our_schedule/repository/auth.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

AuthRepository authRepository = AuthRepository();

toPage() async {
  await Future.delayed(const Duration(milliseconds: 1500));
  bool res = await authRepository.getAuth();

  if (res) {
    Get.offNamed('/dashboard');
  } else {
    Get.offNamed('/users/login');
  }
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    toPage();

    body() {
      return const Center(
        child: Icon(
          Icons.home,
          size: 100,
        ),
      );
    }

    appBar() {
      return AppBar(
        title: const Text('SPLASH'),
      );
    }

    return Scaffold(
      appBar: appBar(),
      body: body(),
    );
  }
}
