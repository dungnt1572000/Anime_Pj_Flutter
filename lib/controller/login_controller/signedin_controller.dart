import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';
import 'package:net_working/constant/api/api_token.dart';
import 'package:net_working/controller/api_service/api_user_client.dart';
import 'package:net_working/controller/login_controller/login_controller.dart';
import 'package:net_working/model/user/user_respone.dart';
import 'package:net_working/view/login/signup_page.dart';

class Signedin_Controller extends GetxController {
  RxBool active = true.obs;
  var sex = Sex.male.obs;
  RxString error_text = ''.obs;
  Login_Controller login_controller = Get.find();
  var userRespone = User_Respone(0, '', '', '', '').obs;
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    userRespone = login_controller.user_respone;
    print(userRespone.toJson());
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
    onDelete;
    login_controller.onDelete;
  }

  void changeUser() {
    Dio dio = Dio();
    dio.options.contentType = 'application/json';
    ApiUserClient(dio, baseUrl: base_url)
        .changeUser(api_token, userRespone.value.id, userRespone.value.toJson())
        .then((value) {
      userRespone.value = value;
      print(userRespone.toJson());
    }).catchError((Object obj) {
      switch (obj.runtimeType) {
        case DioError:
          final res = (obj as DioError).response;
          Logger().e('Got error : ${res?.statusCode} -> ${res?.statusMessage}');
          error_text.value = 'Have this account';
          break;
        default:
          break;
      }
    });
  }
}
