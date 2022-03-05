import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:net_working/controller/login_controller/login_controller.dart';
import 'package:net_working/view/home_page/schedule_page.dart';
import 'package:net_working/view/home_page/search_page.dart';
import 'package:net_working/view/home_page/top_page.dart';

import '../login/login_page.dart';
import '../manga/manga_page.dart';

class HomePage_Drawer extends StatelessWidget {
  Login_Controller lognin_controller = Get.put(Login_Controller());

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue,
      child: ListView(
        children: <Widget>[
          DrawerHeader(
            child: GestureDetector(
              onTap: () {
                  if(lognin_controller.user_respone.value.status==''){
                    Get.toNamed('/login_page');
                  }else{
                    Get.toNamed('/signedin_page');
                  }
                 
                // Navigator.of(context)
                //     .push(MaterialPageRoute(builder: (context) => LoginPage()));
              },
              child: Center(
                  child: Column(
                children: [
                  ClipRRect(
                    child: Image.asset(
                      'assets/img_ava.png',
                      fit: BoxFit.cover,
                      height: 100,
                      width: 100,
                    ),
                    borderRadius: BorderRadius.circular(30),
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  Obx(() {
                    print(lognin_controller.user_respone.value.name);
                    return Text(
                        'Welcome ${lognin_controller.user_respone.value.name}');
                  }),
                ],
              )),
            ),
            decoration: const BoxDecoration(
              color: Colors.orange,
            ),
          ),
          ListTile(
            title: Text("MangaPage".tr),
            onTap: () {
              Get.back();
              Get.toNamed('/manga_page');
            },
          ),
          const Divider(),
          ListTile(
            title: Text("Top".tr),
            onTap: () {
              Get.back();
              Get.toNamed('/top_page');
              // Top_Page();
            },
          ),
          Divider(),
          ListTile(
            title: Text("Search".tr),
            onTap: () {
              Get.back();
              Get.toNamed('/search_page');
              // Top_Page();
            },
          ),
          ListTile(
            title: Text("Schedule".tr),
            onTap: () {
              Get.back();
              Get.toNamed('/schedule_page');
              // Top_Page();
            },
          ),
          Divider(),
        ],
      ),
    );
  }
}
