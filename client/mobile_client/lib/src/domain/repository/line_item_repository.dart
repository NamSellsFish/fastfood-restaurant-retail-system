import '../../util/data_state.dart';
import '../entities/line_item.dart';

abstract class LineItemRepository {
  Future<DataState<List<LineItemEntity>>> getLineItems();
}
