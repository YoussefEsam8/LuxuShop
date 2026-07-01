import 'package:app_fixed/data/model/products/products.dart';
import 'package:app_fixed/data/services/api_services.dart';

class Productsrebository {
  final WebServieces productsWepServieces;

  Productsrebository(this.productsWepServieces);

  Future<List<Product>> getAllProducts() async {
    try {
      var response = await productsWepServieces.getAllProducts();
      return response.products;
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
