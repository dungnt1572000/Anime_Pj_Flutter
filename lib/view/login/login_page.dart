import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/login_controller/signin_controller.dart';

class LoginPage extends StatelessWidget {
  Signin_Controller signin_controller = Get.find();
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
                  decoration: InputDecoration(
                    hintText: 'UserID'
                  ),
                  controller: _idController,
                ),
                TextButton(onPressed: (){
                  signin_controller.signin(_nameController.text, int.parse(_idController.text));
                }, child: Text('Sign in'))
              ],
            )),
            Obx(()=>Text(signin_controller.error_notice.value)),
            Obx(()=>Text(signin_controller.user_respone.value.name))
          ],
        ),
      ),
    );
  }
}
