import 'package:json_annotation/json_annotation.dart';

part 'products.g.dart';

@JsonSerializable()
class Product {
  @JsonKey(name: 'id', defaultValue: 0)
  final int idProduct;

  @JsonKey(name: 'title', defaultValue: '')
  final String titleProduct;

  @JsonKey(name: 'description', defaultValue: '')
  final String descriptionProduct;

  @JsonKey(name: 'category', defaultValue: '')
  final String categoryProduct;

  @JsonKey(name: 'price', defaultValue: 0.0)
  final double priceProduct;

  @JsonKey(name: 'discountPercentage', defaultValue: 0.0)
  final double discountPercentageProduct;

  @JsonKey(name: 'rating', defaultValue: 0.0)
  final double ratingProduct;

  @JsonKey(name: 'stock', defaultValue: 0)
  final int stockProduct;

  @JsonKey(name: 'dimensions', defaultValue: {})
  final Map<String, dynamic> dimensionsProduct;

  @JsonKey(name: 'tags', defaultValue: [])
  final List<String> tagsProduct;

  @JsonKey(name: 'brand', defaultValue: '')
  final String brandProduct;

  @JsonKey(name: 'warrantyInformation', defaultValue: '')
  final String warrantyInformationProduct;

  @JsonKey(name: 'shippingInformation', defaultValue: '')
  final String shippingInformationProduct;

  @JsonKey(name: 'availabilityStatus', defaultValue: '')
  final String availabilityStatusProduct;

  @JsonKey(name: 'images', defaultValue: [])
  final List<String> imagesProduct;

  @JsonKey(name: 'reviews', defaultValue: [])
  final List<dynamic> reviewsProduct;

  Product({
    required this.dimensionsProduct,
    required this.idProduct,
    required this.titleProduct,
    required this.descriptionProduct,
    required this.categoryProduct,
    required this.priceProduct,
    required this.discountPercentageProduct,
    required this.ratingProduct,
    required this.stockProduct,
    required this.tagsProduct,
    required this.brandProduct,
    required this.warrantyInformationProduct,
    required this.shippingInformationProduct,
    required this.availabilityStatusProduct,
    required this.imagesProduct,
    required this.reviewsProduct,
  });

  factory Product.fromJson(Map<String, dynamic> json) =>
      _$ProductFromJson(json);

  Map<String, dynamic> toJson() => _$ProductToJson(this);
}

@JsonSerializable()
class ProductsResponse {
  @JsonKey(name: 'products')
  final List<Product> products;

  ProductsResponse({required this.products});

  factory ProductsResponse.fromJson(Map<String, dynamic> json) =>
      _$ProductsResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ProductsResponseToJson(this);
}
