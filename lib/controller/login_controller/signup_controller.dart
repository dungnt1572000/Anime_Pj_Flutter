import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';
import 'package:net_working/constant/api/api_token.dart';
import 'package:net_working/controller/api_service/api_user_client.dart';
import 'package:net_working/controller/login_controller/login_controller.dart';
import 'package:net_working/model/user/user_create.dart';

import '../../view/login/signup_page.dart';

class Signup_Controller extends GetxController {
  RxBool active = true.obs;
  var sex = Sex.male.obs;
  var userCreate = User_Create('', '', '', '').obs;
  // Signup_Controller signup_controller = Get.find();
  Login_Controller signin_controller = Get.find();
  RxString error_text = ''.obs;

  void makeuserCreate(String sex) {
    userCreate.value.gender = sex;
    userCreate.value.status = active.value ? 'active' : 'inactive';
    print(userCreate.value.toJson());
  }



  void sign_up() async {
    makeuserCreate(sex.value.name);
    Dio dio = Dio();
    dio.options.contentType = 'application/json';
    ApiUserClient(dio, baseUrl: base_url)
        .registerUser(api_token, userCreate.value.toJson())
        .then((value) {
      // userCreate.value = value;
      signin_controller.user_respone.value = value;
      // Logger().e(value.toString());
      error_text.value = '';
      // Get.offNamed('/');
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
