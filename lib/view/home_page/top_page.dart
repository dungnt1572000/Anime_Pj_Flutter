import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:net_working/controller/top_page_controller/top_anime_page_controller.dart';
import 'package:net_working/controller/top_page_controller/top_manga_page_controller.dart';
import 'package:net_working/model/top/top_anime.dart';
import 'package:net_working/model/top/top_manga.dart';

import '../anime/news_page.dart';

class Top_Page extends StatefulWidget {
  @override
  State<Top_Page> createState() => _Top_PageState();
}

class _Top_PageState extends State<Top_Page> {
  int selectedindex = 0; // 0 is anime 1 is manga


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Top'.tr+'Anime'.tr+'/'+'Manga'.tr),
      ),
        bottomNavigationBar: BottomNavigationBar(
          selectedItemColor: Colors.amber[800],
          items:  <BottomNavigationBarItem>[
            BottomNavigationBarItem(
                icon: const Icon(Icons.book),
                label: 'Manga'.tr,
                backgroundColor: Colors.red),
            BottomNavigationBarItem(
                icon: const Icon(Icons.movie_creation_outlined),
                label: 'Anime'.tr,
                backgroundColor: Colors.green),
          ],
          currentIndex: selectedindex,
          onTap: (int index) {
            setState(() {
              selectedindex = index;
            });
          },
        ),
        body: SingleChildScrollView(
          child: Container(
            child: selectedindex == 0 ? manga_screen(selectedindex) : anime_screen(selectedindex),
          ),
        ));
  }

}
Widget anime_screen( int selectedindex) {
  print("selectd index : $selectedindex");
  final Top_Anime_Page_Controller top_anime_page_controller = Get.put(Top_Anime_Page_Controller());
  if(selectedindex==0){
    top_anime_page_controller.onDelete();
  }
  List<String> list_option = ['airing','upcoming','tv','movie','ova','special'];
  return Obx(() {
    if (top_anime_page_controller.isloading.value) {
      return Center(child: CircularProgressIndicator());
    } else {
      return SingleChildScrollView(
        child: Column(children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Obx(() =>
                  Visibility(
                    visible: top_anime_page_controller.page.value != 1,
                    child: ElevatedButton(
                        onPressed: () {
                          top_anime_page_controller.pastPage();
                          top_anime_page_controller.fetchtogetTopAnime();
                        },
                        child: Icon(Icons.arrow_back)),
                  )),
              Obx(() => Text('${top_anime_page_controller.page}')),
              Visibility(
                visible: true,
                child: ElevatedButton(
                    onPressed: () {
                      top_anime_page_controller.nextPage();
                      top_anime_page_controller.fetchtogetTopAnime();
                    },
                    child: Icon(Icons.navigate_next)),
              )
            ],
          ),
          Container(
            height: 55,
            child: ListView.builder(
              
              shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: list_option.length,
                itemBuilder: (context,index){
              return Container(
                margin: EdgeInsets.all(10),
                child: ElevatedButton(
                  
                  style: ElevatedButton.styleFrom(
                      primary: Colors.grey,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30)
                      )
                  ),
                  onPressed: () {
                    top_anime_page_controller.kind(list_option[index]);
                    top_anime_page_controller.fetchtogetTopAnime();
                  }, child: Text(list_option[index]),),
              ) ;
            }),
          ),
          Obx(() =>
              Padding(padding: EdgeInsets.all(12),
                  child: Text(top_anime_page_controller.kind.value.toUpperCase(),
                    style: TextStyle(color: Colors.blue,
                        fontWeight: FontWeight.w500,
                        fontSize: 23),))),
          ListView.builder(
              primary: false,
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
                itemCount: top_anime_page_controller.my_top_anime.value.top.length,
              itemBuilder: (context, index) {
                Top_anime top = top_anime_page_controller.my_top_anime.value.top[index];
                return Container(
                  padding: EdgeInsets.all(5),
                  child: Card(
                    child: GestureDetector(
                      onTap: () {
                        Get.to(() => Web_Page(top.url));
                      },
                      child: Row(
                        children: [
                          Expanded(
                              child: Image.network(
                                top.imageUrl,
                                fit: BoxFit.fill,
                                height: 250,
                                width: 250,
                              )),
                          Expanded(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment
                                    .spaceAround,
                                mainAxisSize: MainAxisSize.max,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    'Rank'.tr+ '${top.rank}',
                                    style: TextStyle(
                                        color: Colors.red,
                                        fontSize: 18,
                                        fontWeight: FontWeight.w700),
                                  ),
                                  Text(
                                    ' ${top.title}',
                                    style: TextStyle(color: Colors.green),
                                  ),
                                  Text('Score'.tr +': ${top.score}'),
                                  Text('Member'.tr +'${top.members}'),
                                ],
                              ))
                        ],
                      ),
                    ),
                  ),
                );
              }),
        ]),
      );
    }
  });
}
Widget manga_screen(int selectedindex) {
  print("selectd index : $selectedindex");
  final Top_Manga_Page_Controller top_page_controller =
  Get.put(Top_Manga_Page_Controller());
  if(selectedindex==1){
    top_page_controller.onDelete;
  }
  return Obx(() {
    if (top_page_controller.isloading.value) {
      return Center(child: CircularProgressIndicator());
    } else {
      return SingleChildScrollView(
        child: Column(children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Obx(() =>
                  Visibility(
                    visible: top_page_controller.page.value != 1,
                    child: ElevatedButton(
                        onPressed: () {
                          top_page_controller.pastPage();
                          top_page_controller.fetchtogetTopManga();
                        },
                        child: Icon(Icons.arrow_back)),
                  )),
              Obx(() => Text('${top_page_controller.page}')),
              Visibility(
                visible: true,
                child: ElevatedButton(
                    onPressed: () {
                      top_page_controller.nextPage();
                      top_page_controller.fetchtogetTopManga();
                    },
                    child: Icon(Icons.navigate_next)),
              )
            ],
          ),
          Wrap(
            spacing: 6.0, // gap between adjacent chips
            runSpacing: 4.0, // gap between lines
            direction: Axis.horizontal, // main axis (rows or columns)
            children: [
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    primary: Colors.grey,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30)
                    )
                ),
                onPressed: () {
                  top_page_controller.kind('manga');
                  top_page_controller.fetchtogetTopManga();
                }, child: Text('manga'),),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      primary: Colors.grey,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30)
                      )
                  ), onPressed: () {
                top_page_controller.kind('novels');
                top_page_controller.fetchtogetTopManga();
              }, child: Text('novels')),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      primary: Colors.grey,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30)
                      )
                  ), onPressed: () {
                top_page_controller.kind('oneshots');
                top_page_controller.fetchtogetTopManga();
              }, child: Text('oneshots')),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      primary: Colors.grey,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30)
                      )
                  ), onPressed: () {
                top_page_controller.kind('doujin');
                top_page_controller.fetchtogetTopManga();
              }, child: Text('doujin')),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      primary: Colors.grey,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30)
                      )
                  ), onPressed: () {
                top_page_controller.kind('manhwa');
                top_page_controller.fetchtogetTopManga();
              }, child: Text('manhwa')),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      primary: Colors.grey,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30)
                      )
                  ), onPressed: () {
                top_page_controller.kind('manhua');
                top_page_controller.fetchtogetTopManga();
              }, child: Text('manhua')),
            ],
          ),
          Obx(() =>
              Padding(padding: EdgeInsets.all(12),
                  child: Text(top_page_controller.kind.value.toUpperCase(),
                    style: const TextStyle(color: Colors.blue,
                        fontWeight: FontWeight.w500,
                        fontSize: 23),))),
          ListView.builder(
              primary: false,
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              itemCount: top_page_controller.myTopManga.value.top.length,
              itemBuilder: (context, index) {
                Top top = top_page_controller.myTopManga.value.top[index];
                return Container(
                  padding: const EdgeInsets.all(5),
                  child: Card(
                    child: GestureDetector(
                      onTap: () {
                        Get.to(() => Web_Page(top.url));
                      },
                      child: Row(
                        children: [
                          Expanded(
                              child: Image.network(
                                top.imageUrl,
                                fit: BoxFit.fill,
                                height: 250,
                                width: 250,
                              )),
                          Expanded(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment
                                    .spaceAround,
                                mainAxisSize: MainAxisSize.max,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    'Rank'.tr+ '${top.rank}',
                                    style: const TextStyle(
                                        color: Colors.red,
                                        fontSize: 18,
                                        fontWeight: FontWeight.w700),
                                  ),
                                  Text(
                                    ' ${top.title}',
                                    style: const TextStyle(color: Colors.green),
                                  ),
                                  Text('Score'.tr+': ${top.score}'),
                                  Text('Member'.tr+ '${top.members}'),
                                ],
                              ))
                        ],
                      ),
                    ),
                  ),
                );
              }),
        ]),
      );
    }
  });
}
