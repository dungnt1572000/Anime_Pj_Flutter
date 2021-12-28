import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:net_working/controller/anime_page_controller.dart';
import 'package:net_working/controller/call_api_serice.dart';
import 'package:net_working/model/news.dart';
import 'package:webview_flutter/webview_flutter.dart';

class News_Page extends StatelessWidget {
  final animePage_controller page_controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Text('News'.tr),
        ),
        body:  FutureBuilder<Animes_News>(
            future: fetchNews(page_controller.x.value),
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                return Text(snapshot.error.toString());
              }
              if (snapshot.data != null) {
                Animes_News am = snapshot.data!;
                return ListView.builder(
                    itemCount: am.articles.length,
                    itemBuilder: (context, index) {
                      Article a = am.articles[index];
                      return Container(
                        margin: EdgeInsets.all(7),
                        height: 250,
                        width: 300,
                        child: GestureDetector(
                          onTap: () {
                            Get.to(() => Web_Page(a.url));
                          },
                          child: Card(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15)),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Expanded(
                                    child: Image.network(
                                  a.imageUrl,
                                  height: 250,
                                  width: 150,
                                  fit: BoxFit.cover,
                                )),
                                Expanded(
                                  child: Stack(children: [
                                    Padding(
                                      padding: EdgeInsets.fromLTRB(10, 6, 0, 3),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          Text(
                                            ' ${a.date}',
                                          ),
                                          Text(
                                            'Author: ${a.authorName}',
                                          ),
                                          Text(
                                            'Main url: ${a.url}',
                                          ),
                                          Text(
                                            ' ${a.intro}',
                                            maxLines: 2,
                                          ),
                                          SizedBox(
                                            height: 20,
                                          )
                                        ],
                                      ),
                                    ),
                                    Positioned(
                                      child: Text(
                                          'Coment: ' + a.comments.toString()),
                                      right: 35,
                                      bottom: 20,
                                    )
                                  ]),
                                )
                              ],
                            ),
                          ),
                        ),
                      );
                    });
              }
              return CircularProgressIndicator();
            },
          ),
        );
  }
}

class Web_Page extends StatefulWidget {
  final String url;

  Web_Page(this.url);

  @override
  _Web_PageState createState() => _Web_PageState();
}

class _Web_PageState extends State<Web_Page> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WebView.platform = AndroidWebView();
  }

  Widget build(BuildContext context) {
    print(widget.url);
    return Scaffold(
      appBar: AppBar(
        title: Text('WebView'.tr),
      ),
      body: Container(
          width: double.infinity,
          // height: 600,
          // the most important part of this example
          child: WebView(
            initialUrl: widget.url,
            // Enable Javascript on WebView
            javascriptMode: JavascriptMode.unrestricted,
          )),
    );
  }
}
