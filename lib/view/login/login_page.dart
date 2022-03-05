import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/login_controller/login_controller.dart';

class LoginPage extends StatelessWidget {
  Login_Controller signin_controller = Get.find();
  TextEditingController _nameController = TextEditingController();
  TextEditingController _idController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text('Login Page'),
            Form(
                child: Column(
              children: [
                TextFormField(
                  decoration: InputDecoration(
                    hintText: 'UserName',
                  ),
                  controller: _nameController,
                ),
                TextFormField(
                  decoration: InputDecoration(hintText: 'UserID'),
                  controller: _idController,
                ),
                Row(
                  children: [
                    TextButton(
                        onPressed: () {
                          signin_controller.login(_nameController.text,
                              int.parse(_idController.text));
                        },
                        child: Text('Sign in')),
                    TextButton(
                        onPressed: () {
                          Get.toNamed('/signup_page');
                        },
                        child: Text('Sign up')),
                  ],
                )
              ],
            )),
            Obx(() => Text(signin_controller.error_notice.value)),
            Obx(() => Text(signin_controller.user_respone.value.name))
          ],
        ),
      ),
    );
  }
}
