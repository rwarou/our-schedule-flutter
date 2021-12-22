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
  bool checked = false;

  body() {
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              height: 100,
              color: Colors.red.withOpacity(0.1),
              child: Text('1'),
            ),
            Container(
              color: Colors.red.withOpacity(0.2),
              child: Text('1'),
            ),
            Container(
              color: Colors.red.withOpacity(0.3),
              child: Text('1'),
            ),
            Container(
              color: Colors.red.withOpacity(0.4),
              child: Text('1'),
            ),
            Container(
              color: Colors.red.withOpacity(0.5),
              child: Text('1'),
            ),
            Container(
              color: Colors.red.withOpacity(0.6),
              child: Text('1'),
            ),
            Container(
              color: Colors.red.withOpacity(0.7),
              child: Text('1'),
            ),
            Container(
              color: Colors.red.withOpacity(0.8),
              child: Text('1'),
            ),
            Container(
              color: Colors.red.withOpacity(0.9),
              child: Text('1'),
            ),
            Container(
              color: Colors.red.withOpacity(1),
              child: Text('1'),
            ),
          ],
        ),
      ),
    );
  }

  noneBody() {
    Size size = MediaQuery.of(context).size;
    double width = size.width;
    double containerWidth = width < 300 ? 200 : 300;
    return GestureDetector(
      onTap: () {},
      child: Center(
        child: Container(
          width: containerWidth,
          height: containerWidth,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(containerWidth / 10),
            border: Border.all(
              width: 1,
              color: Colors.black.withOpacity(0.4),
            ),
          ),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.add,
                  color: Colors.black.withOpacity(0.6),
                  size: 50,
                ),
                Text('약속 추가하기'),
              ],
            ),
          ),
        ),
      ),
    );
  }

  appBar() {
    return AppBar(
      title: Text('Dashboard'),
      actions: [
        IconButton(
          onPressed: () {
            setState(() {
              checked = !checked;
            });
          },
          icon: Icon(
            Icons.check,
            color: checked ? Colors.red : Colors.white,
          ),
        ),
        IconButton(
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
          icon: const Icon(Icons.logout),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(),
      body: checked ? body() : noneBody(),
    );
  }
}
