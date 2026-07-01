import 'package:app_fixed/data/model/categories/categories.dart';
import 'package:app_fixed/data/services/api_services.dart';

class CategoriesRebository {
  final WebServieces webServieces;
  CategoriesRebository({required this.webServieces});

  Future<List<String>> getAllCategories() async {
    try {
      List<CategoryModel> response = await webServieces.getCategoryName();
      List<String> categoriesName = response
          .map((name) => name.categoryName)
          .toList();
      return categoriesName;
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
