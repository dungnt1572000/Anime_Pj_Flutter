import 'package:get/get.dart';
import 'package:net_working/controller/call_api_serice.dart';
import 'package:net_working/model/search/search_anime/search_anime.dart';
import 'package:net_working/model/search/search_manga/search_manga.dart';

class Search_Page_Controller extends GetxController {
  RxBool isManga = true.obs;

  void make_searchManga() {
    isManga(true);
  }

  void make_searchAnime() {
    isManga(false);
  }

  // true is manga
  // false is Anime
  var search_manga = Search_Manga(
          requestHash: '',
          requestCached: false,
          requestCacheExpiry: 1,
          results: [],
          lastPage: 1)
      .obs;
  var search_anime = Search_Anime(
          requestHash: '',
          requestCached: true,
          requestCacheExpiry: 1,
          results: [],
          lastPage: 1)
      .obs;
  RxBool isLoading = true.obs;
  RxInt page = 1.obs;
  RxString search_name = 'Grand'.obs;

  fetchSearch_page() async {
    isLoading(true);
    try {
      if (isManga.value) {
        var mymanga = await fetchSearchManga(page.value, search_name.value);
        search_manga.value = mymanga;
      } else {
        var myanime = await fetchSearchAnime(page.value, search_name.value);
        search_anime.value = myanime;
      }
    } finally {
      isLoading(false);
    }
  }

  void changeName(String str) {
    search_name(str);
  }

  void nextPage() => page++;

  void pastPage() {
    if (page > 1) {
      page--;
    }
  }

  @override
  void onInit() {
    // TODO: implement onInit
    fetchSearch_page();
    super.onInit();
  }

  void onSearch() {
    fetchSearch_page();
  }
}
