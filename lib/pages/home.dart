import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final _idController = TextEditingController();
  final _pwController = TextEditingController();
  String id = '';
  String pw = '';

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _idController.dispose();
    _pwController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size deviceSize = MediaQuery.of(context).size;
    double width = deviceSize.width;
    double height = deviceSize.height;

    OutlineInputBorder border(TextEditingController controller) {
      return OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide(
          width: 1,
          color: controller.text.length >= 4
              ? Colors.lightBlue.withOpacity(0.5)
              : Colors.red.withOpacity(0.5),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('LOGIN'),
      ),
      body: Center(
        child: Container(
          width: width < 300 ? 250 : 300,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: TextField(
                    controller: _idController,
                    decoration: InputDecoration(
                      labelText: 'ID',
                      labelStyle:
                          TextStyle(color: Colors.black.withOpacity(0.5)),
                      hintText: 'ENTER YOUR ID',
                      border: border(_idController),
                      focusedBorder: border(_idController),
                      enabledBorder: border(_idController),
                    ),
                    onChanged: (text) {
                      setState(() {});
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: TextField(
                    controller: _pwController,
                    obscureText: true,
                    decoration: InputDecoration(
                      labelText: 'PASSWORD',
                      labelStyle:
                          TextStyle(color: Colors.black.withOpacity(0.5)),
                      hintText: 'ENTER YOUR PASSWORD',
                      border: border(_pwController),
                      focusedBorder: border(_pwController),
                      enabledBorder: border(_pwController),
                    ),
                    onChanged: (text) {
                      setState(() {});
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5),
                  child: ElevatedButton(
                    onPressed: () {
                      Get.toNamed('/dashboard');
                    },
                    child: const Text('LOGIN'),
                    style: ElevatedButton.styleFrom(
                      primary: Colors.grey,
                      onPrimary: Colors.white,
                      minimumSize: Size(width < 300 ? 250 : 300, 50),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5),
                  child: ElevatedButton(
                    onPressed: () {
                      Get.toNamed('/users/register');
                    },
                    child: const Text('REGISTER'),
                    style: ElevatedButton.styleFrom(
                      primary: Colors.lightBlue,
                      onPrimary: Colors.white,
                      minimumSize: Size(width < 300 ? 250 : 300, 50),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
