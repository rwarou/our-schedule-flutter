import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:our_schedule/repository/auth.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Login> {
  AuthRepository authRepository = AuthRepository();
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

  bool isZero() {
    return _idController.text.isEmpty && _pwController.text.isEmpty;
  }

  bool isLogin() {
    return _idController.text.length >= 4 && _pwController.text.length >= 4;
  }

  @override
  Widget build(BuildContext context) {
    Size deviceSize = MediaQuery.of(context).size;
    double width = deviceSize.width;
    double height = deviceSize.height;

    border(TextEditingController controller) {
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

    inputId() {
      return Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: TextField(
          controller: _idController,
          inputFormatters: [
            FilteringTextInputFormatter.allow(RegExp(r'[a-z|A-Z|0-9]'))
          ],
          decoration: InputDecoration(
            labelText: 'ID',
            labelStyle: TextStyle(color: Colors.black.withOpacity(0.5)),
            hintText: 'ENTER YOUR ID',
            border: border(_idController),
            focusedBorder: border(_idController),
            enabledBorder: border(_idController),
          ),
          onChanged: (text) {
            setState(() {});
          },
        ),
      );
    }

    inputPw() {
      return Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: TextField(
          controller: _pwController,
          obscureText: true,
          inputFormatters: [
            FilteringTextInputFormatter.allow(
                RegExp(r'[\w|$`~!@$!%*#^?&\\(\\)\-_=+\[\]\{\}\;\:\\,\.\<\>]'))
          ],
          decoration: InputDecoration(
            labelText: 'PASSWORD',
            labelStyle: TextStyle(color: Colors.black.withOpacity(0.5)),
            hintText: 'ENTER YOUR PASSWORD',
            border: border(_pwController),
            focusedBorder: border(_pwController),
            enabledBorder: border(_pwController),
          ),
          onChanged: (text) {
            setState(() {});
          },
        ),
      );
    }

    loginButton() {
      return Padding(
        padding: const EdgeInsets.symmetric(vertical: 5),
        child: ElevatedButton(
          onPressed: !isLogin()
              ? null
              : () {
                  Get.toNamed('/dashboard');
                  // Get.offNamed('/dashboard');
                },
          child: const Text('LOGIN'),
          style: ElevatedButton.styleFrom(
            primary: Colors.lightBlue,
            onPrimary: Colors.white,
            minimumSize: Size(width < 300 ? 250 : 300, 50),
          ),
        ),
      );
    }

    registerButton() {
      return Padding(
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
      );
    }

    body() {
      return Center(
        child: Container(
          width: width < 300 ? 250 : 300,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                inputId(),
                inputPw(),
                loginButton(),
                registerButton(),
              ],
            ),
          ),
        ),
      );
    }

    appBar() {
      return AppBar(
        title: const Text('LOGIN'),
      );
    }

    return Scaffold(
      appBar: appBar(),
      body: body(),
    );
  }
}
