import 'package:dio/dio.dart';

import '../../../domain/entities/line_item.dart';
import '../../../domain/entities/product.dart';
import '../../../util/data_state.dart';

// HINT: State được cộng đồng qui ước là immutable, nghĩa là mỗi lần thay đổi state, chúng ta sẽ tạo ra một state mới
final class LineItemEntityState extends DataState<List<LineItemEntity>> {
  const LineItemEntityState(
      {List<LineItemEntity>? data, DioException? error, StateStatus? status})
      : super(data: data, error: error);

  LineItemEntityState copyWith({
    StateStatus Function()? status,
    List<LineItemEntity> Function()? lineItems,
  }) {
    return LineItemEntityState(
        status: status != null ? status() : this.status,
        data: lineItems != null ? lineItems() : data);
  }
}
