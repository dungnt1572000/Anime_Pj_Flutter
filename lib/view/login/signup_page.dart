import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:net_working/controller/login_controller/signup_controller.dart';

enum Sex { male, female }

class Signup_Page extends StatelessWidget {
  // const Signup_Page({ Key? key }) : super(key: key);
  Signup_Controller signup_controller = Get.put(Signup_Controller());
  TextEditingController _name = TextEditingController();
  TextEditingController _email = TextEditingController();
  // TextEditingController _name = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sign in'),
      ),
      body: Container(
        child: Column(
          children: [
            Form(
                child: Column(
              children: [
                TextFormField(
                  controller: _name,
                  decoration: InputDecoration(hintText: 'name'),
                ),
                TextFormField(
                  controller: _email,
                  decoration: InputDecoration(hintText: 'email'),
                ),
                // TextFormField(),
                Obx(() => ListTile(
                      title: const Text('Active'),
                      leading: Checkbox(
                          value: signup_controller.active.value,
                          onChanged: (value) {
                            signup_controller.active.value = value ?? true;
                          }),
                    )),

                Obx(() => ListTile(
                      title: Text('Male'),
                      leading: Radio<Sex>(
                          value: Sex.male,
                          groupValue: signup_controller.sex.value,
                          onChanged: (Sex? value) {
                            signup_controller.sex.value = value!;
                          }),
                    )),
                Obx(() => ListTile(
                    title: Text('Female'),
                    leading: Radio<Sex>(
                        value: Sex.female,
                        groupValue: signup_controller.sex.value,
                        onChanged: (Sex? value) {
                          signup_controller.sex.value = value!;
                        }))),
              ],
            )),
            TextButton(
                onPressed: () {
                  signup_controller.userCreate.value.email = _email.text;
                  signup_controller.userCreate.value.name = _name.text;
                  signup_controller.sign_up();
                },
                child: Text('Sign up')),
            Obx(() => Text(signup_controller.error_text.value)),
            Obx(() => Text(
                signup_controller.signin_controller.user_respone.value.id == 0
                    ? ''
                    : 'Sign up succed! your id:${signup_controller.signin_controller.user_respone.value.id}')),
          ],
        ),
      ),
    );
  }
}
