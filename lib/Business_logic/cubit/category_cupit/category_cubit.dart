import 'package:app_fixed/data/repository/categories_rebository.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'category_cupit_state.dart';

class CategoryCupit extends Cubit<CategoryCupitState> {
  final CategoriesRebository categoriesRebository;
  CategoryCupit(this.categoriesRebository) : super(CategoryCupitInitial());

  Future getAllCategories() async {
    emit(CategoryLoading());
    try {
      List<String> categories = await categoriesRebository.getAllCategories();
      emit(CategoryLoaded(categoriesName: categories));
    } catch (e) {
      emit(CategoryError(error: e.toString()));
    }
  }
}
