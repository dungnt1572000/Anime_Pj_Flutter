
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Widget MoreInfomationWidget() {
  return Container(
    margin: const EdgeInsets.fromLTRB(15, 0, 0, 15),
    height: 50,
    child: Row(
      children: [
        ElevatedButton(
          onPressed: () {
            Get.toNamed('/news_page');
          },
          child: Text(
            'News'.tr,
            style: const TextStyle(color: Colors.green),
          ),
          style: ElevatedButton.styleFrom(
              onPrimary: Colors.green,
              primary: Colors.white,
              shape: RoundedRectangleBorder(
                  side: const BorderSide(width: 1, color: Colors.green),
                  borderRadius: BorderRadius.circular(10))),
        ),
        const SizedBox(
          width: 20,
        ),
        ElevatedButton(
          onPressed: () {
            Get.toNamed('/images_page');
          },
          child: Text(
            'Images'.tr,
            style: const TextStyle(color: Colors.green),
          ),
          style: ElevatedButton.styleFrom(
              primary: Colors.white,
              onPrimary: Colors.green,
              shape: RoundedRectangleBorder(
                  side: const BorderSide(width: 1, color: Colors.green),
                  borderRadius: BorderRadius.circular(10))),
        ),
        const SizedBox(
          width: 20,
        ),
        ElevatedButton(
          onPressed: () {
            Get.toNamed('/reviews_page');
          },
          child: Text(
            'reviews'.tr,
            style: const TextStyle(color: Colors.green),
          ),
          style: ElevatedButton.styleFrom(
              primary: Colors.white,
              onPrimary: Colors.green,
              shape: RoundedRectangleBorder(
                  side: const BorderSide(width: 1, color: Colors.green),
                  borderRadius: BorderRadius.circular(10))),
        ),
      ],
    ),
  );
}
