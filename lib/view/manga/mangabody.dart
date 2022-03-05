import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:readmore/readmore.dart';
import 'character.dart';
import 'moreinformation_widget.dart';
import '../../model/manga.dart';

class mangaBody extends StatelessWidget {
  final Manga m;

  const mangaBody(this.m);

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
              const Divider(),
              const Text(
                'Back ground',
                style: TextStyle(color: Colors.green, fontSize: 20),
              ),
              ReadMoreText(
                '      ' + m.background,
                trimLines: 4,
                style: const TextStyle(color: Colors.black),
                colorClickableText: Colors.blue,
                trimMode: TrimMode.Line,
                trimCollapsedText: 'Show more',
                trimExpandedText: 'Show less',
              ),
              const Divider(),
              const Text('Character'),
              CharacterWidget(),
              // _characterWidget(),
              
              const Divider(
                height: 32,
              ),
              MoreInfomationWidget(),
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
                    style: const TextStyle(color: Colors.blue, fontSize: 25),
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
