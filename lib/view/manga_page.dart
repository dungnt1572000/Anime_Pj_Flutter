import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:net_working/controller/anime_page_controller.dart';

import '../main.dart';

class Manga_Page extends StatelessWidget {
  final animePage_controller p = Get.put(animePage_controller());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Manga'.tr),),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Obx(() => Visibility(
                      visible: p.x.value != 1,
                      child: ElevatedButton(
                          onPressed: () {
                            p.pastPage();
                            p.fetchtogetManga();
                          },
                          child: Icon(Icons.arrow_back)),
                    )),
                Obx(() => Text('${p.x}')),
                Obx(() => Visibility(
                      visible: !p.isLast.value,
                      child: ElevatedButton(
                          onPressed: () {
                            p.nextPage();
                            p.fetchtogetManga();
                          },
                          child: Icon(Icons.navigate_next)),
                    ))
              ],
            ),
            Obx(() {
              if (p.isLoading.value && !p.isLast.value) {
                return CircularProgressIndicator();
              } else if (!p.isLoading.value && !p.isLast.value) {
                return myHomePage(p.My_manga.value);
              } else {
                return Text("Last page");
              }
            }),
          ],
        ),
      ),
    );
  }
}
