import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:intl/intl.dart';
import 'package:net_working/constant/data.dart';
import 'package:net_working/constant/make_widget.dart';
import 'package:net_working/constant/translations/vocabulary.dart';
import 'package:net_working/controller/schedule_page_controller.dart';
import 'package:net_working/model/manga.dart';
import 'package:net_working/model/schedule.dart';
import 'package:net_working/view/home_page/homepage_drawer.dart';
import 'package:net_working/view/login/login_page.dart';
import 'package:net_working/view/login/signedin_page.dart';
import 'package:net_working/view/manga/manga_page.dart';
import 'package:net_working/view/anime/page_reviews.dart';
import 'package:net_working/view/home_page/schedule_page.dart';
import 'package:net_working/view/home_page/search_page.dart';
import 'package:net_working/view/home_page/top_page.dart';
import 'package:readmore/readmore.dart';

import 'controller/anime_page_controller.dart';
import 'controller/call_api_serice.dart';
import 'model/anime/animes_characters.dart';
import 'view/anime/images.dart';
import 'view/anime/news_page.dart';
import 'view/home_page/myhome.dart';
import 'view/login/signup_page.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  // MobileAds.instance.initialize();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'OK bro',
      color: Colors.white,
      translations: Vocabulary(),
      locale: const Locale('en', 'US'),
      fallbackLocale: const Locale('en', 'US'),
      // theme: ThemeData(primarySwatch: Colors.blue,),
      initialRoute: '/',
      routes: {
        '/': (context) => MyHome(),
        '/login_page': (context)=>LoginPage(),
        '/signup_page': (_)=>Signup_Page(),
        '/signedin_page': (_)=>Signedin_Page(),
        '/images_page': (context)=>More_Images(),
        '/news_page':(_)=>News_Page(),
        '/reviews_page': (_)=>Page_Reviews(),
        '/manga_page':(_)=>Manga_Page(),
        '/schedule_page':(_)=>Schedule_Page(),
        '/search_page':(_)=>const Search_Page(),
        '/top_page':(_)=>Top_Page(),

      },
      // home: MyHome(),
      // theme: ThemeData.light(),
    );
  }
}
