// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'products.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Product _$ProductFromJson(Map<String, dynamic> json) => Product(
  dimensionsProduct: json['dimensions'] as Map<String, dynamic>? ?? {},
  idProduct: (json['id'] as num?)?.toInt() ?? 0,
  titleProduct: json['title'] as String? ?? '',
  descriptionProduct: json['description'] as String? ?? '',
  categoryProduct: json['category'] as String? ?? '',
  priceProduct: (json['price'] as num?)?.toDouble() ?? 0.0,
  discountPercentageProduct:
      (json['discountPercentage'] as num?)?.toDouble() ?? 0.0,
  ratingProduct: (json['rating'] as num?)?.toDouble() ?? 0.0,
  stockProduct: (json['stock'] as num?)?.toInt() ?? 0,
  tagsProduct:
      (json['tags'] as List<dynamic>?)?.map((e) => e as String).toList() ?? [],
  brandProduct: json['brand'] as String? ?? '',
  warrantyInformationProduct: json['warrantyInformation'] as String? ?? '',
  shippingInformationProduct: json['shippingInformation'] as String? ?? '',
  availabilityStatusProduct: json['availabilityStatus'] as String? ?? '',
  imagesProduct:
      (json['images'] as List<dynamic>?)?.map((e) => e as String).toList() ??
      [],
  reviewsProduct: json['reviews'] as List<dynamic>? ?? [],
);

Map<String, dynamic> _$ProductToJson(Product instance) => <String, dynamic>{
  'id': instance.idProduct,
  'title': instance.titleProduct,
  'description': instance.descriptionProduct,
  'category': instance.categoryProduct,
  'price': instance.priceProduct,
  'discountPercentage': instance.discountPercentageProduct,
  'rating': instance.ratingProduct,
  'stock': instance.stockProduct,
  'dimensions': instance.dimensionsProduct,
  'tags': instance.tagsProduct,
  'brand': instance.brandProduct,
  'warrantyInformation': instance.warrantyInformationProduct,
  'shippingInformation': instance.shippingInformationProduct,
  'availabilityStatus': instance.availabilityStatusProduct,
  'images': instance.imagesProduct,
  'reviews': instance.reviewsProduct,
};

ProductsResponse _$ProductsResponseFromJson(Map<String, dynamic> json) =>
    ProductsResponse(
      products: (json['products'] as List<dynamic>)
          .map((e) => Product.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ProductsResponseToJson(ProductsResponse instance) =>
    <String, dynamic>{'products': instance.products};
