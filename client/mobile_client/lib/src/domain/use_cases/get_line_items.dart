import '../../util/data_state.dart';
import '../../util/use_case.dart';
import '../entities/line_item.dart';
import '../repository/line_item_repository.dart';

class GetLineItemsUseCase
    implements UseCase<DataState<List<LineItemEntity>>, void> {
  final LineItemRepository _lineItemRepository;
  GetLineItemsUseCase(this._lineItemRepository);

  /// HINT: Nơi tập kết của nhiều use case cùng 1 family (bằng cách overload hàm execute).
  // HINT: Ví dụ như duyệt cây thì sẽ có duyệt dưới lên trên, trên xuống dưới,
  // HINT: trái qua phải, phải qua trái
  @override
  Future<DataState<List<LineItemEntity>>> call({void params}) {
    return _lineItemRepository.getLineItems();
  }
}
