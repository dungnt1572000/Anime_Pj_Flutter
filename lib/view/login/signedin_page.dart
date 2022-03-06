import 'dart:js';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:net_working/controller/login_controller/login_controller.dart';
import 'package:net_working/controller/login_controller/signedin_controller.dart';
import 'package:net_working/controller/login_controller/signup_controller.dart';

import 'signup_page.dart';

class Signedin_Page extends StatefulWidget {
  @override
  State<Signedin_Page> createState() => _Signedin_PageState();
}

class _Signedin_PageState extends State<Signedin_Page> {
  bool? checkbox;

  TextEditingController _nameController = TextEditingController();

  TextEditingController _emailController = TextEditingController();

  Signedin_Controller signedin_controller = Get.put(Signedin_Controller());

  Sex? _sex;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _nameController.text = signedin_controller.userRespone.value.name;
    _emailController.text = signedin_controller.userRespone.value.email;
    checkbox =
        signedin_controller.userRespone.value.status == 'active' ? true : false;
    _sex = signedin_controller.userRespone.value.gender == 'female'
        ? Sex.female
        : Sex.male;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Acount Information'),
        leading: IconButton(
            onPressed: () {
              Get.offNamed('/');
            },
            icon: Icon(Icons.arrow_back)),
      ),
      body: Container(
        alignment: Alignment.center,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text('Your ID: ${signedin_controller.userRespone.value.id}'),
              Form(
                  child: Column(
                children: [
                  TextFormField(
                    decoration: const InputDecoration(
                      hintText: 'UserName',
                    ),
                    // onChanged: (string){

                    // },
                    controller: _nameController,
                  ),
                  TextFormField(
                    decoration: const InputDecoration(hintText: 'UserID'),
                    controller: _emailController,
                  ),
                  ListTile(
                    title: const Text('Active'),
                    leading: Checkbox(
                        value: checkbox,
                        onChanged: (value) {
                          setState(() {
                            checkbox = value!;
                            if (value) {
                              signedin_controller.userRespone.value.status =
                                  'active';
                            } else {
                              signedin_controller.userRespone.value.status =
                                  'inactive';
                            }
                            print(signedin_controller.userRespone.value.status);
                          });
                          // signup_controller.active.value = value ?? true;
                        }),
                  ),
                  ListTile(
                    title: const Text('Male'),
                    leading: Radio<Sex>(
                        value: Sex.male,
                        groupValue: _sex,
                        onChanged: (Sex? value) {
                          setState(() {
                            _sex = value;
                            signedin_controller.userRespone.value.gender =
                                value!.name;
                            print(signedin_controller.userRespone.value.gender);
                          });
                        }),
                  ),
                  ListTile(
                      title: const Text('Female'),
                      leading: Radio<Sex>(
                          value: Sex.female,
                          groupValue: _sex,
                          onChanged: (Sex? value) {
                            setState(() {
                              _sex = value;
                              signedin_controller.userRespone.value.gender =
                                  value!.name;
                              print(
                                  signedin_controller.userRespone.value.gender);
                            });
                          })),
                  Row(children: [
                    TextButton(
                        onPressed: () {
                          _showDialog(context);
                        },
                        child: const Text('Changed ')),
                    TextButton(
                        onPressed: () {
                          signedin_controller.onDelete;
                          Get.delete<Login_Controller>();
                          Get.delete<Signup_Controller>();
                          Get.offNamed('/');
                        },
                        child: Text(' log out')),
                  ])
                ],
              )),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _showDialog(BuildContext context) async {
    return showDialog<void>(
        barrierDismissible: false,
        context: context,
        builder: (context) => AlertDialog(
              title: const Text('You want change?'),
              actions: [
                TextButton(
                    onPressed: () {
                      signedin_controller.userRespone.value.name =
                          _nameController.text;
                      signedin_controller.userRespone.value.email =
                          _emailController.text;

                      signedin_controller.changeUser();
                      Get.offNamed('/');
                      // Get.off
                    },
                    child: const Text('Yes')),
                TextButton(
                    onPressed: () {
                      Get.back();
                    },
                    child: const Text('No'))
              ],
            ));
  }
}
