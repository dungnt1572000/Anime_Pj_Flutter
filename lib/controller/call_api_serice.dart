import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:net_working/model/anime/animes_characters.dart';
import 'package:net_working/model/anime/images.dart';
import 'package:net_working/model/anime/news.dart';
import 'package:net_working/model/anime/reviews.dart';
import 'package:net_working/model/schedule.dart';
import 'package:net_working/model/search/search_anime/search_anime.dart';
import 'package:net_working/model/search/search_manga/search_manga.dart';
import 'package:net_working/model/top/top_anime.dart';
import 'package:net_working/model/top/top_manga.dart';
import '../model/manga.dart';

Future<Manga?> fetchAnimes(int page) async{
  String str_anime_page = 'https://api.jikan.moe/v3/manga/$page' ;
  final respone = await http.get(Uri.parse(str_anime_page));
  if(respone.statusCode == 200){
    return Manga.fromJson(jsonDecode(respone.body));
  }
  else{
    return null;
  }
}

Future<Animes_characters> fetchCharacter(int anime_id) async{
  final respone = await http.get(Uri.parse('https://api.jikan.moe/v3/manga/$anime_id/characters'));
  if(respone.statusCode == 200){
    return Animes_characters.fromJson(jsonDecode(respone.body));
  }
  else{
    throw Exception('Fails to load characters');
  }
}
Future<Animes_News> fetchNews(int anime_id) async{
  final respone = await http.get(Uri.parse('https://api.jikan.moe/v3/manga/$anime_id/news'));
  if(respone.statusCode == 200){
    return Animes_News.fromJson(jsonDecode(respone.body));
  }
  else{
    throw Exception('Fails to load characters');
  }
}

Future<Images> fetchImages(int anime_id) async{
  final respone = await http.get(Uri.parse('https://api.jikan.moe/v3/manga/$anime_id/pictures'));
  if(respone.statusCode == 200){
    return Images.fromJson(jsonDecode(respone.body));
  }
  else{
    throw Exception('Fails to load characters');
  }
}
Future<My_Reviews> fetchReviews(int anime_id, int page) async{
  var respone;
  if(page==1){
    respone = await http.get(Uri.parse('https://api.jikan.moe/v3/manga/$anime_id/reviews'));
  }
  else{
    respone = await http.get(Uri.parse('https://api.jikan.moe/v3/manga/$anime_id/reviews/$page'));
  }

  if(respone.statusCode == 200){
    return My_Reviews.fromJson(jsonDecode(respone.body));
  }
  else{
    throw Exception('Fails to load characters');
  }
}

Future<Top_Manga> fetchTopManga(int page, String kind) async{
  var respone = await http.get(Uri.parse('https://api.jikan.moe/v3/top/manga/$page/$kind'));
  if(respone.statusCode == 200){
    return Top_Manga.fromJson(jsonDecode(respone.body));
  }else{
    throw Exception('Fails to load ');
  }
}

Future<Top_Anime> fetchTopAnime(int page, String kind) async{
  var respone = await http.get(Uri.parse('https://api.jikan.moe/v3/top/anime/$page/$kind'));
  if(respone.statusCode == 200){
    return Top_Anime.fromJson(jsonDecode(respone.body));
  }else{
    throw Exception('Fails to load ');
  }
}

Future<Search_Manga> fetchSearchManga(int page, String name) async{
  if(name == ''){
    name = 'grand';
  }
  var respone = await http.get(Uri.parse('https://api.jikan.moe/v3/search/manga?q=$name&page=$page'));
  if(respone.statusCode == 200){
    return Search_Manga.fromJson(jsonDecode(respone.body));
  }else{
    throw Exception('Fails to load ');
  }
}

Future<Search_Anime> fetchSearchAnime(int page, String name) async{
  if(name == ''){
    name = 'grand';
  }
  var respone = await http.get(Uri.parse('https://api.jikan.moe/v3/search/anime?q=$name&page=$page'));
  if(respone.statusCode == 200){
    return Search_Anime.fromJson(jsonDecode(respone.body));
  }else{
    throw Exception('Fails to load ');
  }
}

Future<Schedule> fetchSchedule(String days) async{
  var respone = await http.get(Uri.parse('https://api.jikan.moe/v3/schedule/$days'));
  if(respone.statusCode == 200){
    return Schedule.fromJson(jsonDecode(respone.body));
  }else{
    throw Exception('Fails to load ');
  }
}