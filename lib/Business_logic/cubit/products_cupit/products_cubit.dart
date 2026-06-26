import 'package:app_fixed/data/model/products.dart';
import 'package:app_fixed/data/repository/products_rebository.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'products_state.dart';

class ProductsCubit extends Cubit<ProductsState> {
  ProductsCubit(this.productsrebository) : super(ProductsInitial());

  final Productsrebository productsrebository;

  void getAllProducts() async {
    emit(ProductsLoading());
    try {
      final List<Product> products = await productsrebository.getAllProducts();
      emit(ProductsSuccess(products));
    } catch (e) {
      print(
        "🔴 CUBIT ERROR: $e",
      ); // 🔥 السطر ده هيطبع لك الأيرور لو الـ Parsing لسه زعلان
      emit(ProductsError(e.toString()));
    }
  }
}
