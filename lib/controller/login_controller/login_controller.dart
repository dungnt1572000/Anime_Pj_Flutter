import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';
import 'package:net_working/constant/api/api_token.dart';
import 'package:net_working/controller/api_service/api_user_client.dart';
import 'package:net_working/controller/login_controller/signup_controller.dart';
import 'package:net_working/model/user/user_respone.dart';

class Login_Controller extends GetxController {
  var user_respone = User_Respone(0, '', '', '', '').obs;
  RxString error_notice = ''.obs;
  
  void login(String name, int id) async {
    Dio dio = Dio();
    dio.options.contentType = 'application/json';
    ApiUserClient(dio, baseUrl: base_url).getUser(api_token, id).then((value) {
      if (value.name == name) {
        user_respone.value = value;
        error_notice.value = '';
      } else {
        error_notice.value = 'Wrong Username or id';
      }
    }).catchError((Object obj) {
      switch (obj.runtimeType) {
        case DioError:
          final res = (obj as DioError).response;
          Logger().e('Got error : ${res?.statusCode} -> ${res?.statusMessage}');
          error_notice.value = 'Wrong Username or id';
          break;
        default:
          break;
      }
    });
  }
}
