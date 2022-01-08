import 'package:dio/dio.dart';
import 'package:msa_internship/app/constants.dart';
import 'package:msa_internship/data/responses/responses.dart';
import 'package:retrofit/http.dart';
part 'app_api.g.dart';

@RestApi(baseUrl: Constants.baseUrl)
abstract class AppServiceClient {
  factory AppServiceClient(Dio dio, {String baseUrl}) = _AppServiceClient;

  @POST("/login")
  Future<AuthenticationResponse> login();
}
