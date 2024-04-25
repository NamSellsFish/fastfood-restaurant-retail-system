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

  LineItemEntity copyWith({int? quantity, String? size, bool? status}) {
    return LineItemEntity(
        id: id,
        product: product,
        quantity: quantity ?? this.quantity,
        size: size ?? this.size,
        status: status ?? this.status);
  }

  static List<LineItemEntity> updateWithList(List<LineItemEntity> lineItems,
      [LineItemEntity? newlineItem]) {
    if (newlineItem == null) {
      return [];
    }
    final index =
        lineItems.indexWhere((element) => element.id == newlineItem.id);
    if (index == -1) {
      return [...lineItems, newlineItem];
    }
    final newLineItems = List<LineItemEntity>.from(lineItems);
    newLineItems[index] = newlineItem;
    return newLineItems;
  }

  @override
  List<Object?> get props => [id, quantity, size, product];
}
