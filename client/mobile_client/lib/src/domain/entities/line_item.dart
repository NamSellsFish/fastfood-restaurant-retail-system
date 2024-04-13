import 'package:equatable/equatable.dart';
import 'package:mobile_client/src/domain/entities/product.dart';

class LineItemEntity extends Equatable {
  final int? id;
  final ProductEntity? product;
  final int? quantity;
  final String? size;
  final bool? status;

  const LineItemEntity(
      {this.id, this.product, this.quantity, this.size, this.status});

  @override
  List<Object?> get props => [id, quantity, size, product];
}
