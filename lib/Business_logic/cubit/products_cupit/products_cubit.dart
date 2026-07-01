import 'package:app_fixed/data/model/products/products.dart';
import 'package:app_fixed/data/repository/products_rebository.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'products_state.dart';

class ProductsCubit extends Cubit<ProductsState> {
  ProductsCubit(this.productsrebository) : super(ProductsInitial());

  List<Product> allproducts = [];
  String selectedcategory = 'All';
  final Productsrebository productsrebository;

  void getAllProducts() async {
    emit(ProductsLoading());
    try {
      final List<Product> products = await productsrebository.getAllProducts();
      emit(ProductsSuccess(products));
      allproducts = products;
    } catch (e) {
      emit(ProductsError(e.toString()));
    }
  }

  void filterCategories(String selectcategory) {
    selectedcategory = selectcategory;
    if (selectcategory.toLowerCase() == 'all') {
      emit(ProductsSuccess(allproducts));
    } else {
      List<Product> filterCategories = allproducts
          .where(
            (data) =>
                data.categoryProduct.toLowerCase() ==
                selectcategory.toLowerCase(),
          )
          .toList();

      emit(ProductsSuccess(filterCategories));
    }
  }
}
