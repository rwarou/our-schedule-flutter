import 'package:flutter/material.dart';

class MyPage extends StatefulWidget {
  const MyPage({Key? key}) : super(key: key);

  @override
  _MyPageState createState() => _MyPageState();
}

class _MyPageState extends State<MyPage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double width = size.width;

    border() {
      return OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide:
            BorderSide(width: 1, color: Colors.lightBlue.withOpacity(0.5)),
      );
    }

    avatar() {
      return Container(
        width: 150,
        height: 150,
        margin: EdgeInsets.only(top: 30),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(80),
          color: Colors.pinkAccent.withOpacity(0.7),
        ),
        child: const Icon(
          Icons.person,
          color: Colors.white,
          size: 100,
        ),
      );
    }

    name() {
      return Container(
        padding: EdgeInsets.only(top: 30, bottom: 30),
        width: 200,
        child: Container(
          padding: EdgeInsets.only(bottom: 10),
          alignment: Alignment.center,
          width: 150,
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(
                color: Colors.black.withOpacity(0.2),
              ),
            ),
          ),
          child: const Text(
            '이름이름',
            style: TextStyle(fontSize: 20),
          ),
        ),
      );
    }

    groupListButton() {
      return GestureDetector(
        onTap: () {},
        child: Container(
          alignment: Alignment.center,
          width: 200,
          height: 50,
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(
                color: Colors.black.withOpacity(0.2),
              ),
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Text(
                '모임 목록',
                style: TextStyle(fontSize: 18),
              ),
              Icon(
                Icons.chevron_right,
                size: 30,
              ),
            ],
          ),
        ),
      );
    }

    return Container(
      padding: EdgeInsets.all(20),
      alignment: Alignment.center,
      child: Column(
        children: <Widget>[
          avatar(),
          name(),
          groupListButton(),
        ],
      ),
    );
  }
}
