import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:net_working/controller/anime_page_controller.dart';
import 'package:net_working/controller/call_api_serice.dart';
import 'package:net_working/controller/reviews_controller.dart';
import 'package:net_working/model/anime/reviews.dart';
import 'package:readmore/readmore.dart';

class Page_Reviews extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('reviews'),
      ),
      body: MyPageReviews(),
    );
  }
}

class MyPageReviews extends StatelessWidget {
  final Review_Controller reviews_controller = Get.put(Review_Controller());
  final animePage_controller page_controller = Get.put(animePage_controller());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: SingleChildScrollView(
      child: Column(children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Obx(
              () => reviews_controller.positionPage == 1
                  ? SizedBox()
                  : ElevatedButton(
                      onPressed: () {
                        reviews_controller.pastPage();
                      },
                      child: Icon(Icons.arrow_back)),
            ),
            Obx(() => Text('${reviews_controller.positionPage}')),
            Obx(() => reviews_controller.last_page.isTrue? SizedBox(): ElevatedButton(
                onPressed: () {
                  reviews_controller.nextPage();
                },
                child: Icon(Icons.navigate_next)))
          ],
        ),
        Obx(() => FutureBuilder<My_Reviews>(
              future: fetchReviews(page_controller.x.value,
                  reviews_controller.positionPage.value),
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  reviews_controller.last_page = true as RxBool;
                  return Text(snapshot.error.toString());
                }
                if (snapshot.hasData) {
                  print('page_controller la: ${page_controller.x}');
                  return ListView.builder(
                      shrinkWrap: true,
                      primary: false,
                      itemCount: snapshot.data!.reviews.length,
                      itemBuilder: (context, index) {
                        Reviews myReviews = snapshot.data!.reviews[index];
                        return _reviews_item(myReviews);
                      });
                }
                return CircularProgressIndicator();
              },
            )),
      ]),
    ));
  }

  Widget _reviews_item(Reviews myReviews) {
    return Container(
      margin: EdgeInsets.all(5),
      padding: EdgeInsets.all(5),
      child: Column(
        children: [
          Row(
            children: [
              Image.network(
                myReviews.reviewer.imageUrl,
                fit: BoxFit.cover,
                height: 60,
                width: 60,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    myReviews.reviewer.username,
                    style: TextStyle(fontSize: 17, color: Colors.blue),
                  ),
                  Text('${myReviews.helpfulCount} found it gud'),
                ],
              )
            ],
          ),
          ReadMoreText(
            myReviews.content,
            trimLines: 2,
            colorClickableText: Colors.blue,
            style: const TextStyle(color: Colors.black),
            trimMode: TrimMode.Line,
            trimCollapsedText: 'Show more',
            trimExpandedText: 'Show less',
          ),
          Divider()
        ],
      ),
    );
  }
}
