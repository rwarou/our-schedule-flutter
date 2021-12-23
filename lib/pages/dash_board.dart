import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:our_schedule/repository/auth.dart';

import 'calendar/calendar.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  AuthRepository authRepository = AuthRepository();
  bool checked = false;
  int _selectedIndex = 0;
  final List<String> datas = ['강릉 여행', '보드게임 하러 가자', '제주도 3박4일 계획'];
  final List<Widget> widgets = [Calendar(), Text('add'), Text('my page')];

  listBody() {
    return Container(
      padding: const EdgeInsets.all(20),
      child: ListView.builder(
        itemCount: datas.length,
        itemBuilder: (BuildContext context, int index) => GestureDetector(
          onTap: () {},
          child: Container(
            margin: const EdgeInsets.symmetric(vertical: 10),
            padding: const EdgeInsets.symmetric(
              vertical: 20,
              horizontal: 10,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                width: 1,
                color: Colors.black.withOpacity(0.5),
              ),
            ),
            child: Row(
              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Expanded(
                  flex: 2,
                  child: Icon(
                    Icons.image,
                    size: 50,
                  ),
                ),
                Expanded(
                  flex: 7,
                  child: Column(
                    children: [
                      Text(datas[index]),
                      Text('놀러 가는 날짜 $index'),
                      Text('이름 $index'),
                    ],
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Text('${index + 1}/4'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  addBody() {
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
      body: widgets[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: _selectedIndex == 0
                ? const Icon(Icons.home_filled)
                : const Icon(Icons.home_outlined),
            label: 'home',
          ),
          BottomNavigationBarItem(
            icon: _selectedIndex == 1
                ? const Icon(Icons.add)
                : const Icon(Icons.add_outlined),
            label: 'home',
          ),
          BottomNavigationBarItem(
            icon: _selectedIndex == 2
                ? const Icon(Icons.person)
                : const Icon(Icons.person_outline),
            label: 'home',
          ),
        ],
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        currentIndex: _selectedIndex,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        selectedItemColor: Colors.black,
      ),
    );
  }
}
