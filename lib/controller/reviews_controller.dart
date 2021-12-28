import 'package:get/get.dart';

class Review_Controller extends GetxController{
  RxInt positionPage = 1.obs;
  RxBool last_page = false.obs;
  void nextPage(){
    positionPage++;
  }
  void pastPage(){
    if(positionPage>1){
      positionPage--;
    }
  }
}