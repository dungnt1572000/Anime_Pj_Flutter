import 'package:get/get.dart';
import 'package:net_working/controller/call_api_serice.dart';
import 'package:net_working/model/manga.dart';

class animePage_controller extends GetxController{
  RxInt x = 1.obs;
  RxBool isLoading = true.obs;
  RxBool isLast = false.obs;
  var My_manga = Manga(requestHash: '', requestCached: false, requestCacheExpiry: 100, malId: 1, url: '', title: '',
      titleEnglish: '', titleSynonyms: [], titleJapanese: '',
      status: '', imageUrl: '', type: '', volumes: 1,
      chapters: 1, publishing:false , published: Published(prop: Prop(from: From(day: 1,month: 1,year: 1), to: From(day: 1,year: 1,month: 1)), string: '', from: '', to: ''),
      rank: 1, score: 1, scoredBy: 1, popularity: 1,
      members: 1, favorites: 1, synopsis: '',
      background: '', related: Related(myList: []), genres: [],
      explicitGenres: [], demographics: [], themes: [], authors: [],
      serializations: [], externalLinks: []).obs;

   fetchtogetManga() async{
     isLoading(true);
     try {
       var mymanga = await fetchAnimes(x.value);
       if (mymanga != null) {
         My_manga.value = mymanga;
         isLast(false);
       }else{
         isLast(true);
         print('have error? isLast: ${isLast.toString()}');
       }
     }finally{
       isLoading(false);
     }
  }

  @override
  void onInit() {
     fetchtogetManga();
    super.onInit();
  }

  void nextPage(){
    x=x+1;
  }
  void pastPage(){
    if(x>1){
      x=x-1;
    }
  }

}