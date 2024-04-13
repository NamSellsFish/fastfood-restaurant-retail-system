import 'dart:ffi';

import 'package:equatable/equatable.dart';

class ProductEntity extends Equatable {
  final int? id;
  final String? name;
  final Float? price;
  final String? description;
  final String? urlToImage;
  final String? dateAdded;
  final String? dateUpdated;
  final String? category;

// TODO 1: Implement the ProductEntity constructor
  const ProductEntity(
      {this.id,
      required this.name,
      this.price,
      this.description,
      this.urlToImage,
      this.dateAdded,
      this.dateUpdated,
      this.category});

// HINT: The list of properties that will be used to determine whether two instances are equal.
  @override
  List<Object?> get props => [
        id,
        name,
        price,
        description,
        urlToImage,
        dateAdded,
        dateUpdated,
        category
      ];
}
