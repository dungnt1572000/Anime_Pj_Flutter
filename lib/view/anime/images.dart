import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:net_working/controller/anime_page_controller.dart';
import 'package:net_working/controller/call_api_serice.dart';
import 'package:net_working/model/anime/images.dart';

class More_Images extends StatelessWidget {
  final animePage_controller page_controller = Get.find();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('Images more'),
      ),
      body: SafeArea(
        child: FutureBuilder<Images>(
            future: fetchImages(page_controller.x.value),
            builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Text('Some thing wrong');
          }
          if (snapshot.data != null) {
            List<Pictures> _listPic = snapshot.data!.pictures;
            return StaggeredGridView.countBuilder(
              crossAxisCount: 4,
              itemCount: _listPic.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  child: Hero(
                      tag: _listPic[index].large,
                      child: Image.network(_listPic[index].large)),
                  onTap: () {
                    Get.to(DetailPictureScreen(_listPic[index].large));
                  },
                );
              },
              staggeredTileBuilder: (int index) =>
              new StaggeredTile.count(2, index.isEven ? 2 : 1),
              mainAxisSpacing: 4.0,
              crossAxisSpacing: 4.0,
            );
          }
          return CircularProgressIndicator();
        }),
      ),
    );
  }
}

class DetailPictureScreen extends StatelessWidget {
  final String tagofHero;

  DetailPictureScreen(this.tagofHero);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: GestureDetector(
        onTap: () {
          Get.back();
        },
        child: Center(
          child: Hero(
            tag:tagofHero, child: Image.network(tagofHero),
          ),
        ),
      ),

    );
  }
}
