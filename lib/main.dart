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
import 'package:net_working/view/homepage_drawer.dart';
import 'package:net_working/view/login/login_page.dart';
import 'package:net_working/view/manga_page.dart';
import 'package:net_working/view/anime/page_reviews.dart';
import 'package:net_working/view/schedule_page.dart';
import 'package:net_working/view/search_page.dart';
import 'package:net_working/view/top_page.dart';
import 'package:readmore/readmore.dart';

import 'controller/anime_page_controller.dart';
import 'controller/call_api_serice.dart';
import 'model/anime/animes_characters.dart';
import 'view/anime/images.dart';
import 'view/anime/news_page.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  MobileAds.instance.initialize();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'OK bro',
      color: Colors.white,
      translations: Vocabulary(),
      locale: Locale('en', 'US'),
      fallbackLocale: Locale('en', 'US'),
      // theme: ThemeData(primarySwatch: Colors.blue,),
      home: MyHome(),
      theme: ThemeData.light(),
    );
  }
}

class MyHome extends StatefulWidget {
  @override
  _MyHomeState createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> with SingleTickerProviderStateMixin {
  final animePage_controller p = Get.put(animePage_controller());
  final Schedule_Page_Controller s = Get.put(Schedule_Page_Controller());
  final BannerAd myBanner = BannerAd(
    adUnitId: 'ca-app-pub-2408776039414207/1668529686',
    size: AdSize.fullBanner,
    request: AdRequest(),
    listener: BannerAdListener(
      // Called when an ad is successfully received.
      onAdLoaded: (Ad ad) => print('Ad loaded.'),
      // Called when an ad request failed.
      onAdFailedToLoad: (Ad ad, LoadAdError error) {
        // Dispose the ad here to free resources.
        ad.dispose();
        print('Ad failed to load: $error');
      },
      // Called when an ad opens an overlay that covers the screen.
      onAdOpened: (Ad ad) => print('Ad opened.'),
      // Called when an ad removes an overlay that covers the screen.
      onAdClosed: (Ad ad) => print('Ad closed.'),
      // Called when an impression occurs on the ad.
      onAdImpression: (Ad ad) => print('Ad impression.'),
    ),
  );

  DateTime cur = DateTime.now();

  late AnimationController controller;
  late Animation sizeAnimationHeight;
  late Animation sizeAnimationWidth;
  @override
  void initState() {
    super.initState();
    controller =  AnimationController(vsync: this, duration: Duration(seconds: 1));
    controller.addListener(() {
      setState(() {});
    });

    controller.forward();

    var format = DateFormat('EEEE').format(cur);
    print("HJome page day : $format");
    s.getDays(format.toLowerCase());
    print(s.days.value);
    s.refreshfetch();
    myBanner.load();

  }



  Widget selectedItem = flag_list[0];

  @override
  Widget build(BuildContext context) {
    final AdWidget adWidget = AdWidget(ad: myBanner);
    final Container adContainer = Container(
      alignment: Alignment.center,
      child: adWidget,
      width: myBanner.size.width.toDouble(),
      height: myBanner.size.height.toDouble(),
    );
    sizeAnimationHeight = Tween<double>(begin: 100.0, end: MediaQuery.of(context).size.height).animate(controller);
    sizeAnimationWidth = Tween<double>(begin: 100.0, end: MediaQuery.of(context).size.width).animate(controller);
    return Scaffold(
        appBar: AppBar(
          title: Text('Anime'.tr + '/' + 'Manga'.tr + 'App'.tr),
          actions: <Widget>[
            Padding(
                padding: EdgeInsets.only(right: 5),
                child: DropdownButton(
                    value: selectedItem,
                    onChanged: (Widget? x) {
                      setState(() {
                        selectedItem = x!;
                        if (selectedItem == flag_list[0]) {
                          print('Chon vienma');
                          Get.updateLocale(const Locale('vn', 'VN'));
                        }
                        if (selectedItem == flag_list[2]) {
                          print('Chon US');
                          Get.updateLocale(const Locale('en', 'US'));
                        }
                        if (selectedItem == flag_list[1]) {
                          print('Chon JP');
                          Get.updateLocale(const Locale('jp', 'JP'));
                        }
                      });
                    },
                    items: flag_list.map<DropdownMenuItem<Widget>>((e) {
                      return DropdownMenuItem<Widget>(child: e, value: e);
                    }).toList()))
          ],
        ),
        drawer: Drawer(
            child: HomePage_Drawer()),
        body: Center(
          child: Container(
            alignment: Alignment.center,
            height: sizeAnimationHeight.value,
            width: sizeAnimationWidth.value,
            child: Stack(children: [
              SingleChildScrollView(
                child: Container(
                  margin: EdgeInsets.all(15),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 70,
                      ),
                      Text(
                        'Today'.tr + 'TV',
                        style: const TextStyle(fontSize: 25, color: Colors.amber),
                      ),
                      Obx(
                        () => SizedBox(
                          height: 350,
                          child: ListView.builder(
                            shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) {
                              Sche_Item item = s.schedule.value.days[index];
                              DateTime c = DateTime.parse(item.airingStart);
                              return SizedBox(
                                height: 350,
                                width: 250,
                                child: GestureDetector(
                                  onTap: () {
                                    Get.to(() => Web_Page(item.url));
                                  },
                                  child: Card(
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(13)),
                                    elevation: 8,
                                    child: Padding(
                                      padding: const EdgeInsets.all(12),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'Start at'.tr + ' : ${c.hour}h UTC',
                                            style: const TextStyle(
                                                color: Colors.deepOrange,
                                                fontSize: 19),
                                          ),
                                          Text(item.title),
                                          Text('Score'.tr +
                                              ': ${item.score ?? 'unknown'}'),
                                          Image.network(
                                            item.imageUrl,
                                            fit: BoxFit.fill,
                                            height: 200,
                                            width: 250,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            },
                            itemCount: s.schedule.value.days.length,
                          ),
                        ),
                      ),
                      Divider(),
                      Text(
                        'Hot Manga',
                        style: TextStyle(fontSize: 25, color: Colors.amber),
                      ),
                      Container(
                        height: 200,
                        child: ListView.builder(
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            return Container(
                              margin: EdgeInsets.all(5),
                              height: 500,
                              width: 250,
                              child: Card(
                                child: GestureDetector(
                                  onTap: () {
                                    Get.to(Web_Page(listAnime[index].url));
                                  },
                                  child: Container(
                                    padding: EdgeInsets.all(15),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Expanded(
                                            flex: 1,
                                            child: Text(
                                              listAnime[index].name,
                                              style: TextStyle(
                                                  color: Colors.red, fontSize: 14),
                                            )),
                                        Expanded(
                                            flex: 8,
                                            child: Image.network(
                                              listAnime[index].urlImage,
                                              fit: BoxFit.fill,
                                              height: 200,
                                              width: 280,
                                            )),
                                        Expanded(
                                          flex: 1,
                                          child: Row(
                                            children: [
                                              Expanded(
                                                  child: Text(
                                                      'So Tap: ${listAnime[index].episone}')),
                                              Expanded(
                                                  child: Text(
                                                      'View: ${listAnime[index].view}'))
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            );
                          },
                          itemCount: listAnime.length,
                        ),
                      ),
                      Divider(),
                      const Text(
                        'Your List',
                        style: TextStyle(fontSize: 25, color: Colors.amber),
                      ),
                      SizedBox(
                        height: 200,
                        child: ListView.builder(
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            return Container(
                              margin: const EdgeInsets.all(5),
                              height: 500,
                              width: 250,
                              child: Card(
                                child: GestureDetector(
                                  onTap: () {
                                    Get.to(Web_Page(listAnime[index].url));
                                  },
                                  child: Container(
                                    padding: const EdgeInsets.all(15),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Expanded(
                                            flex: 1,
                                            child: Text(
                                              listAnime[index].name,
                                              style: TextStyle(
                                                  color: Colors.red, fontSize: 14),
                                            )),
                                        Expanded(
                                            flex: 8,
                                            child: Image.network(
                                              listAnime[index].urlImage,
                                              fit: BoxFit.fill,
                                              height: 200,
                                              width: 280,
                                            )),
                                        Expanded(
                                          flex: 1,
                                          child: Row(
                                            children: [
                                              Expanded(
                                                  child: Text(
                                                      'So Tap: ${listAnime[index].episone}')),
                                              Expanded(
                                                  child: Text(
                                                      'View: ${listAnime[index].view}'))
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            );
                          },
                          itemCount: listAnime.length,
                        ),
                      ),

                    ],
                  ),
                ),

              ),
              Positioned(
                  top: 0,
                  child:  adContainer)

            ]),
          ),
        ));
  }

  Widget drop_down_button_change_language() {
    Widget selectedItem = flag_list[0];
    return DropdownButton(
        value: selectedItem,
        onChanged: (Widget? x) {
          setState(() {
            selectedItem = x!;
            print('Dang chon roi ne');
          });
        },
        items: flag_list.map<DropdownMenuItem<Widget>>((e) {
          return DropdownMenuItem<Widget>(child: e, value: e);
        }).toList());
  }
}

class myHomePage extends StatelessWidget {
  final Manga m;

  myHomePage(this.m);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 270,
              ),
              Text('Published : ${m.published.string}', maxLines: 2),
              RatingBar.builder(
                  itemCount: 10,
                  allowHalfRating: true,
                  initialRating: m.score,
                  ignoreGestures: true,
                  itemBuilder: (context, _) => const Icon(
                        Icons.star,
                        color: Colors.amber,
                      ),
                  onRatingUpdate: (rate) {}),
              const Text(
                ' Sunopis:',
                style: TextStyle(color: Colors.green, fontSize: 20),
              ),
              ReadMoreText(
                '      ' + m.synopsis,
                trimLines: 4,
                colorClickableText: Colors.blue,
                style: const TextStyle(color: Colors.black),
                trimMode: TrimMode.Line,
                trimCollapsedText: 'Show more',
                trimExpandedText: 'Show less',
              ),
              Divider(),
              Text(
                'Back ground',
                style: TextStyle(color: Colors.green, fontSize: 20),
              ),
              ReadMoreText(
                '      ' + m.background,
                trimLines: 4,
                style: TextStyle(color: Colors.black),
                colorClickableText: Colors.blue,
                trimMode: TrimMode.Line,
                trimCollapsedText: 'Show more',
                trimExpandedText: 'Show less',
              ),
              Divider(),
              Text('Character'),
              _characterWidget(),
              Divider(
                height: 32,
              ),
              _moreInfomation(),
            ],
          ),
          Positioned(
              top: 120,
              left: 0,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '${m.title}\n(${m.titleJapanese})',
                    style: TextStyle(color: Colors.blue, fontSize: 25),
                  ),
                  Text('Authors: ' + m.authors[0].name),
                  Text('Status : ${m.status}'),
                  Text('Type : ${m.type}')
                ],
              )),
          Positioned(
            width: 225,
            height: 250,
            child: Image.network(
              m.imageUrl,
              fit: BoxFit.fill,
            ),
            top: 0,
            right: 0,
          )
        ],
      ),
    );
  }
}

Widget _moreInfomation() {
  return Container(
    margin: EdgeInsets.fromLTRB(15, 0, 0, 15),
    height: 50,
    child: Row(
      children: [
        ElevatedButton(
          onPressed: () {
            Get.to(News_Page());
          },
          child: Text(
            'News'.tr,
            style: TextStyle(color: Colors.green),
          ),
          style: ElevatedButton.styleFrom(
              onPrimary: Colors.green,
              primary: Colors.white,
              shape: RoundedRectangleBorder(
                  side: BorderSide(width: 1, color: Colors.green),
                  borderRadius: BorderRadius.circular(10))),
        ),
        SizedBox(
          width: 20,
        ),
        ElevatedButton(
          onPressed: () {
            Get.to(More_Images());
          },
          child: Text(
            'Images'.tr,
            style: TextStyle(color: Colors.green),
          ),
          style: ElevatedButton.styleFrom(
              primary: Colors.white,
              onPrimary: Colors.green,
              shape: RoundedRectangleBorder(
                  side: BorderSide(width: 1, color: Colors.green),
                  borderRadius: BorderRadius.circular(10))),
        ),
        SizedBox(
          width: 20,
        ),
        ElevatedButton(
          onPressed: () {
            Get.to(Page_Reviews());
          },
          child: Text(
            'reviews'.tr,
            style: TextStyle(color: Colors.green),
          ),
          style: ElevatedButton.styleFrom(
              primary: Colors.white,
              onPrimary: Colors.green,
              shape: RoundedRectangleBorder(
                  side: BorderSide(width: 1, color: Colors.green),
                  borderRadius: BorderRadius.circular(10))),
        ),
      ],
    ),
  );
}

class _characterWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _characterState();
  }
}

class _characterState extends State<_characterWidget> {
  final animePage_controller page_controller = Get.put(animePage_controller());
  late Future<Animes_characters> future_animes_Characters;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Obx(() => FutureBuilder<Animes_characters>(
        future: fetchCharacter(page_controller.x.value),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return CircularProgressIndicator();
          }
          if (snapshot.hasData) {
            Animes_characters c = snapshot.data!;
            return Container(
              height: 250,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                primary: false,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return SizedBox(
                    width: 200,
                    child: Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15)),
                      color: Colors.white,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.network(
                            c.characters[index].imageUrl,
                            fit: BoxFit.cover,
                            width: 150,
                            height: 150,
                          ),
                          Text(
                            c.characters[index].name,
                            style: TextStyle(color: Colors.green, fontSize: 25),
                          ),
                          Text(c.characters[index].role)
                        ],
                      ),
                    ),
                  );
                },
                itemCount: c.characters.length,
              ),
            );
          }
          return const CircularProgressIndicator();
        }));
  }
}
