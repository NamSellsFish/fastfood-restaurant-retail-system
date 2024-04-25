// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductModel _$ProductModelFromJson(Map<String, dynamic> json) => ProductModel(
      id: json['id'] as int?,
      name: json['name'] as String?,
      description: json['description'] as String?,
      price: (json['price'] as num?)?.toDouble(),
      urlToImage: json['urlToImage'] as String?,
      dateAdded: json['dateAdded'] as String?,
      dateUpdated: json['dateUpdated'] as String?,
      category: json['category'] as String?,
    );

Map<String, dynamic> _$ProductModelToJson(ProductModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'price': instance.price,
      'description': instance.description,
      'urlToImage': instance.urlToImage,
      'dateAdded': instance.dateAdded,
      'dateUpdated': instance.dateUpdated,
      'category': instance.category,
    };
