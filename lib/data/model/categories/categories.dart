import 'package:json_annotation/json_annotation.dart';

part 'categories.g.dart';

@JsonSerializable()
class CategoryModel {
  @JsonKey(name: 'name', defaultValue: '')
  final String categoryName;
  CategoryModel({required this.categoryName});

  factory CategoryModel.fromJson(Map<String, dynamic> json) =>
      _$CategoryModelFromJson(json);

  Map<String, dynamic> toJson() => _$CategoryModelToJson(this);
}
