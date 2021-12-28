import 'package:get/get.dart';
import 'package:net_working/controller/call_api_serice.dart';
import 'package:net_working/model/top/top_manga.dart';

class Top_Manga_Page_Controller extends GetxController{
  RxInt page = 1.obs;
  RxString kind = 'manga'.obs;
  RxBool isloading = true.obs;
  var myTopManga = Top_Manga('requestHash', true, 1, []).obs;

  void changekind(String newkind){
    kind(newkind);
  }
  void nextPage() => page++;
  void pastPage(){
    if(page.value > 1){
      page--;
    }
  }

  fetchtogetTopManga() async{
    isloading(true);
    try{
      var topmanga = await fetchTopManga(page.value,kind.value);
      myTopManga.value = topmanga;
    }finally{
      isloading(false);
    }
  }

  @override
  void onInit() {
    fetchtogetTopManga();
    super.onInit();
  }

  @override
  void onClose() {

  }
}