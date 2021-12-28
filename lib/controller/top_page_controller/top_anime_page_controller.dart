import 'package:get/get.dart';
import 'package:net_working/controller/call_api_serice.dart';
import 'package:net_working/model/top/top_anime.dart';

class Top_Anime_Page_Controller extends GetxController{
  RxInt page = 1.obs;
  RxString kind = 'airing'.obs;
  RxBool isloading = true.obs;
  var my_top_anime = Top_Anime('', false, 1, []).obs;

  void changekind(String newkind){
    kind(newkind);
  }
  void nextPage() => page++;
  void pastPage(){
    if(page.value > 1){
      page--;
    }
  }

  fetchtogetTopAnime() async{
    isloading(true);
    try{
      var topanime = await fetchTopAnime(page.value,kind.value);
      my_top_anime.value = topanime;
    }finally{
      isloading(false);
    }
  }
  @override
  void onInit() {
    // TODO: implement onInit
    fetchtogetTopAnime();
    super.onInit();
  }
}