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
  final List<String> datas = ['A', 'B', 'C'];

  body() {
    return Container(
      padding: const EdgeInsets.all(20),
      child: ListView.builder(
        itemCount: datas.length,
        // separatorBuilder: (BuildContext context, int index) => Divider(
        //   thickness: 1,
        //   color: Colors.black.withOpacity(0.3),
        // ),
        itemBuilder: (BuildContext context, int index) => Container(
          margin: const EdgeInsets.symmetric(vertical: 5),
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
              width: 1,
              color: Colors.black.withOpacity(0.5),
            ),
          ),
          child: Text(datas[index]),
        ),
      ),
    );
  }

  noneBody() {
    Size size = MediaQuery.of(context).size;
    double width = size.width;
    double containerWidth = width < 300 ? 200 : 300;
    return GestureDetector(
      onTap: () {
        Get.toNamed('/dashboard/add');
      },
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
                const Text('약속 추가하기'),
              ],
            ),
          ),
        ),
      ),
    );
  }

  appBar() {
    return AppBar(
      title: const Text('Dashboard'),
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
