// import 'package:app_fixed/core/constants/strings.dart';
import 'package:app_fixed/core/constants/strings.dart';
import 'package:app_fixed/data/model/products.dart';
import 'package:app_fixed/data/model/user.dart';
import 'package:dio/dio.dart';

import 'package:retrofit/http.dart';
import 'package:retrofit/error_logger.dart';

part 'api_services.g.dart';

@RestApi(baseUrl: 'https://dummyjson.com/')
abstract class WebServieces {
  factory WebServieces(Dio dio, {String? baseUrl}) = _WebServieces;
  @GET('products')
  Future<ProductsResponse> getAllProducts();

  @POST(loginEndPoint)
  Future<User> login(@Body() Map<String, dynamic> loginBody);
}
