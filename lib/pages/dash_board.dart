import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:our_schedule/repository/auth.dart';

import 'dashboard/add.dart';
import 'dashboard/calendar.dart';
import 'dashboard/my_page.dart';

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
  final List<Widget> widgets = [const Calendar(), const Add(), const MyPage()];

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
            label: '',
          ),
          BottomNavigationBarItem(
            icon: _selectedIndex == 1
                ? const Icon(Icons.add)
                : const Icon(Icons.add_outlined),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: _selectedIndex == 2
                ? const Icon(Icons.person)
                : const Icon(Icons.person_outline),
            label: '',
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
