import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:net_working/controller/login_controller/signin_controller.dart';
import 'package:net_working/view/schedule_page.dart';
import 'package:net_working/view/search_page.dart';
import 'package:net_working/view/top_page.dart';

import 'login/login_page.dart';
import 'manga_page.dart';

class HomePage_Drawer extends StatelessWidget {
  Signin_Controller signin_controller = Get.put(Signin_Controller());

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue,
      child: ListView(
        children: <Widget>[
          DrawerHeader(
            child: GestureDetector(
              onTap: (){
                Navigator.of(context).push(MaterialPageRoute(builder: (context)=>LoginPage()));
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
                        print(signin_controller.user_respone.value.name);
                        return Text('Welcome ${signin_controller.user_respone.value
                            .name}');
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
              Get.to(() => Manga_Page());
            },
          ),
          const Divider(),
          ListTile(
            title: Text("Top".tr),
            onTap: () {
              Get.back();
              Get.to(() => Top_Page());
              // Top_Page();
            },
          ),
          Divider(),
          ListTile(
            title: Text("Search".tr),
            onTap: () {
              Get.back();
              Get.to(() => Search_Page());
              // Top_Page();
            },
          ),
          ListTile(
            title: Text("Schedule".tr),
            onTap: () {
              Get.back();
              Get.to(() => Schedule_Page());
              // Top_Page();
            },
          ),
          Divider(),
        ],
      ),
    );
  }
}
