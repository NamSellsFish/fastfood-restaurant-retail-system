import 'package:json_annotation/json_annotation.dart';
import '../../domain/entities/product.dart';
part 'product.g.dart';

@JsonSerializable()
class ProductModel extends ProductEntity {
  const ProductModel({
    super.id,
    super.name,
    super.description,
    super.price,
    super.urlToImage,
    super.dateAdded,
    super.dateUpdated,
    super.category,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) =>
      _$ProductModelFromJson(json);

  Map<String, dynamic> toJson() => _$ProductModelToJson(this);
}
