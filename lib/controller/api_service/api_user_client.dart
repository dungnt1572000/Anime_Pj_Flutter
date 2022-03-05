import 'package:net_working/constant/api/api_token.dart';
import 'package:net_working/model/user/user_create.dart';
import 'package:net_working/model/user/user_respone.dart';
import 'package:retrofit/http.dart';
import 'package:dio/dio.dart';
part 'api_user_client.g.dart';

@RestApi(baseUrl: base_url)
abstract class ApiUserClient{
  factory ApiUserClient(Dio dio, {required String baseUrl}) = _ApiUserClient;

  @GET('/public/v2/users/{id}')
  Future<User_Respone> getUser(@Header('Authorization') String token,@Path('id') int id);

  @POST('/public/v2/users')
  Future<User_Create> registerUser(@Header('Authorization') String token, @Body() Map<String,dynamic> body);
}