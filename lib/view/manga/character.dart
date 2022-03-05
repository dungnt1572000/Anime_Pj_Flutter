import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/get_core.dart';

import '../../controller/anime_page_controller.dart';
import '../../controller/call_api_serice.dart';
import '../../model/anime/animes_characters.dart';

class CharacterWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _characterState();
  }
}
class _characterState extends State<CharacterWidget> {
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
            return const CircularProgressIndicator();
          }
          if (snapshot.hasData) {
            Animes_characters c = snapshot.data!;
            return SizedBox(
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
                            style: const TextStyle(color: Colors.green, fontSize: 25),
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
