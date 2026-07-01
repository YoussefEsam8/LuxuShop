// import 'package:app_fixed/core/constants/strings.dart';
import 'package:app_fixed/core/constants/strings.dart';
import 'package:app_fixed/data/model/categories/categories.dart';
import 'package:app_fixed/data/model/products/products.dart';
import 'package:app_fixed/data/model/user/user.dart';
import 'package:dio/dio.dart';
// import 'package:flutter/foundation.dart';

import 'package:retrofit/http.dart';
import 'package:retrofit/error_logger.dart';

part 'api_services.g.dart';

@RestApi(baseUrl: 'https://dummyjson.com/')
abstract class WebServieces {
  factory WebServieces(Dio dio, {String? baseUrl}) =
      _WebServieces; //Redirecting Factory-- _WebServieces  المصنع الموجه
  @GET('products')
  Future<ProductsResponse> getAllProducts();

  @POST(loginEndPoint)
  Future<User> login(@Body() Map<String, dynamic> loginBody);

  @GET('products/categories')
  Future<List<CategoryModel>> getCategoryName();
}
