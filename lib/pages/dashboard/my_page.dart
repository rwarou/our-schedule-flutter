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

    return Padding(
      padding: EdgeInsets.all(20),
      child: Container(
        alignment: Alignment.center,
        child: Column(
          children: <Widget>[
            Container(
              width: 150,
              height: 150,
              margin: EdgeInsets.only(top: 30),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(80),
                  color: Colors.lightBlueAccent),
              child: const Icon(
                Icons.person,
                color: Colors.white,
                size: 100,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
