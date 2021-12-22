import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:dio/dio.dart';
import 'package:our_schedule/repository/auth.dart';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  var dio = Dio();
  final scaffoldKey = GlobalKey<ScaffoldState>();
  late AuthRepository authRepository;
  final _idController = TextEditingController();
  final _pwController = TextEditingController();
  final _nameController = TextEditingController();
  String id = '';
  String pw = '';
  String name = '';

  @override
  void initState() {
    super.initState();
    authRepository = AuthRepository();
  }

  @override
  void dispose() {
    _idController.dispose();
    _pwController.dispose();
    _nameController.dispose();
    super.dispose();
  }

  bool isZero() {
    return _idController.text.isEmpty && _pwController.text.isEmpty;
  }

  bool isRegister() {
    return _idController.text.length >= 4 &&
        _pwController.text.length >= 4 &&
        _nameController.text.isNotEmpty;
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

    nameBorder(TextEditingController controller) {
      return OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide(
          width: 1,
          color: controller.text.isNotEmpty
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

    inputName() {
      return Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: TextField(
          controller: _nameController,
          inputFormatters: [
            FilteringTextInputFormatter.allow(RegExp(r'[ㄱ-ㅎ|ㅏ-ㅣ|가-힣|a-z|A-Z]'))
          ],
          decoration: InputDecoration(
            labelText: 'NAME',
            labelStyle: TextStyle(color: Colors.black.withOpacity(0.5)),
            hintText: 'ENTER YOUR NAME',
            border: nameBorder(_nameController),
            focusedBorder: nameBorder(_nameController),
            enabledBorder: nameBorder(_nameController),
          ),
          onChanged: (text) {
            setState(() {});
          },
        ),
      );
    }

    registerButton() {
      return Padding(
        padding: const EdgeInsets.symmetric(vertical: 5),
        child: ElevatedButton(
          onPressed: !isRegister()
              ? null
              : () async {
                  dynamic auth = {
                    'id': _idController.text,
                    'pw': _pwController.text,
                    'name': _nameController.text
                  };

                  // try {
                  //   dynamic res = await dio
                  //       .post('http://127.0.0.1:3000/users/auth', data: auth);
                  //   print('dio success : $res');
                  // } catch (error) {
                  //   print('dio error : $error');
                  // }
                  bool res = await authRepository.setAuth(auth);
                  res
                      ? Get.toNamed('/dashboard')
                      : ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('잠시 후 다시 시도해주세요.'),
                            duration: Duration(
                              milliseconds: 1500,
                            ),
                          ),
                        );
                  // Get.toNamed('/dashboard');
                  // Get.offNamed('/dashboard');
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
                inputName(),
                registerButton(),
              ],
            ),
          ),
        ),
      );
    }

    appBar() {
      return AppBar(
        title: Text('REGISTER'),
      );
    }

    return Scaffold(
      key: scaffoldKey,
      appBar: appBar(),
      body: body(),
    );
  }
}
