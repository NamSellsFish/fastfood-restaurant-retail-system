import 'package:mobile_client/src/domain/entities/line_item.dart';
import 'package:json_annotation/json_annotation.dart';

import 'product.dart';
part 'line_item.g.dart';

@JsonSerializable()
class LineItemModel extends LineItemEntity {
  const LineItemModel(
    this.product, {
    super.id,
    super.size,
    super.quantity,
  });
  @override
  @JsonKey(
    name: 'product',
    toJson: _toJsonProduct,
    fromJson: _fromJsonProduct,
  )
  final ProductModel? product;
  factory LineItemModel.fromJson(Map<String, dynamic> json) =>
      _$LineItemModelFromJson(json);

  Map<String, dynamic> toJson() => _$LineItemModelToJson(this);

  static ProductModel? _fromJsonProduct(Map<String, dynamic>? json) =>
      ProductModel.fromJson(json!);
  static Map<String, dynamic>? _toJsonProduct(ProductModel? product) =>
      product?.toJson();
}
