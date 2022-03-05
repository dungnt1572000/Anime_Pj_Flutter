import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:material_floating_search_bar/material_floating_search_bar.dart';
import 'package:net_working/controller/search_page_controller.dart';
import 'package:net_working/controller/top_page_controller/top_manga_page_controller.dart';
import 'package:net_working/model/search/search_anime/search_anime.dart';
import 'package:net_working/model/search/search_manga/search_manga.dart';
import 'package:net_working/model/top/top_manga.dart';
import 'package:net_working/view/anime/news_page.dart';

class Search_Page extends StatelessWidget {
  const Search_Page({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        fit: StackFit.expand,
        children: [

          buildMap(),
          buildFloatingSearchBar(context),
        ],
      ),
    );
  }
}

Widget buildMap() {
  final Search_Page_Controller search_page_controller =
      Get.put(Search_Page_Controller());
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(onPressed: (){
                search_page_controller.make_searchAnime();
                print(search_page_controller.isManga.toString());
              }, child: Text('Anime'.tr)),
              ElevatedButton(onPressed: (){
                search_page_controller.make_searchManga();
                print(search_page_controller.isManga.toString());
              }, child: Text('Manga'.tr)),
            ],
          ),
          Text('\n\nChoose Anime or Manga! Auto is Anime'.tr),
          SizedBox(height: 30,),
          Obx(()=>Text(search_page_controller.isManga.value?"Manga".tr:'Anime'.tr,style: TextStyle(color: Colors.deepOrange,fontSize: 25),)),
        ],
      ),
    );
}

// buildFloatingSearchBar(context)
Widget buildFloatingSearchBar(BuildContext context) {
  final isPortrait = MediaQuery.of(context).orientation == Orientation.portrait;
  final Search_Page_Controller search_page_controller =
      Get.put(Search_Page_Controller());
  return FloatingSearchBar(
    hint: 'Search'.tr,
    scrollPadding: const EdgeInsets.only(top: 16, bottom: 56),
    transitionDuration: const Duration(milliseconds: 800),
    transitionCurve: Curves.easeInOut,
    physics: const BouncingScrollPhysics(),
    axisAlignment: isPortrait ? 0.0 : -1.0,
    openAxisAlignment: 0.0,
    width: isPortrait ? 600 : 500,
    debounceDelay: const Duration(milliseconds: 500),
    onQueryChanged: (query) {
      // Call your model, bloc, controller here.
      Future.delayed(Duration(milliseconds: 500));
      search_page_controller.changeName(query);

      search_page_controller.onSearch();
    },
    // Specify a custom transition to be used for
    // animating between opened and closed stated.
    transition: CircularFloatingSearchBarTransition(),
    actions: [
      // FloatingSearchBarAction(
      //   showIfOpened: false,
      //   child: CircularButton(
      //     icon: const Icon(Icons.search),
      //     onPressed: () {
      //       print('on search');
      //       search_page_controller.onSearch();
      //     },
      //   ),
      // ),
      FloatingSearchBarAction.searchToClear(
        showIfClosed: false,
      ),
    ],
    builder: (context, transition) {
      return Container(
        color: Colors.white,
        child: Obx(() {
          if (search_page_controller.isLoading.value) {
            return const Center(child: CircularProgressIndicator());
          } else {
            List<String> nameOfElement = [];
            List<String> img_urlOfElement = [];
            List<String> urlofElement =[];
            if(search_page_controller.isManga.value){
              Search_Manga search_manga =
                  search_page_controller.search_manga.value;
              nameOfElement = search_manga.results.map((e) => e.title).toList();
              img_urlOfElement = search_manga.results.map((e) => e.imageUrl).toList();
              urlofElement = search_manga.results.map((e) => e.url).toList();
            }else{
              Search_Anime search_anime = search_page_controller.search_anime.value;
              nameOfElement = search_anime.results.map((e) => e.title).toList();
              img_urlOfElement = search_anime.results.map((e) => e.imageUrl).toList();
              urlofElement = search_anime.results.map((e) => e.url).toList();
            }
            return ListView.builder(
                primary: false,
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                itemCount: nameOfElement.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(nameOfElement[index]),
                    onTap: () {
                      Get.to(Web_Page(urlofElement[index]));
                    },
                    leading: CircleAvatar(
                        radius: 20,
                        backgroundImage: NetworkImage(img_urlOfElement[index])
                    ),
                  );
                });
          }
        }),
      );
    },
  );
}
