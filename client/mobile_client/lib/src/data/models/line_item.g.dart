// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'line_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LineItemModel _$LineItemModelFromJson(Map<String, dynamic> json) =>
    LineItemModel(
      LineItemModel._fromJsonProduct(json['product'] as Map<String, dynamic>?),
      id: json['id'] as int?,
      size: json['size'] as String?,
      quantity: json['quantity'] as int?,
    );

Map<String, dynamic> _$LineItemModelToJson(LineItemModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'quantity': instance.quantity,
      'size': instance.size,
      'product': LineItemModel._toJsonProduct(instance.product),
    };
