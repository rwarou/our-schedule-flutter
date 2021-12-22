import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:our_schedule/repository/auth.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  AuthRepository authRepository = AuthRepository();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dashboard'),
      ),
      body: Center(
        child: ElevatedButton(
          child: Text('logout'),
          onPressed: () async {
            bool res = await authRepository.deleteAuth();
            if (res) {
              Get.offAllNamed('/');
            } else {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('로그아웃 실패'),
                  duration: Duration(
                    milliseconds: 1500,
                  ),
                ),
              );
            }
          },
        ),
      ),
    );
  }
}
