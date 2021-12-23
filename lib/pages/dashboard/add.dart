import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Add extends StatefulWidget {
  const Add({Key? key}) : super(key: key);

  @override
  _AddState createState() => _AddState();
}

class _AddState extends State<Add> {
  @override
  Widget build(BuildContext context) {
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
}
