import 'package:flutter/material.dart';

import 'signup_page.dart';

class Signin_Page extends StatelessWidget {
  TextEditingController _nameController = TextEditingController();
  TextEditingController _idController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Acount Information')),
      body: Container(
        alignment: Alignment.center,
        child: Center(
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
                  ListTile(
                  title: const Text('Active'),
                  leading: Checkbox(
                      value: ,
                      onChanged: (value) {
                        // signup_controller.active.value = value ?? true;
                      }),
                ),

                ListTile(
                  title: Text('Male'),
                  leading: Radio<Sex>(
                      value: Sex.male,
                      groupValue: signup_controller.sex.value,
                      onChanged: (Sex? value) {
                        signup_controller.sex.value = value!;
                      }),
                ),
                ListTile(
                    title: Text('Female'),
                    leading: Radio<Sex>(
                        value: Sex.female,
                        groupValue: ,
                        onChanged: (Sex? value) {
                          signup_controller.sex.value = value!;
                        })),
                  TextButton(onPressed: () {}, child: Text('Sign in'))
                ],
              )),
            ],
          ),
        ),
      ),
    );
  }
}
