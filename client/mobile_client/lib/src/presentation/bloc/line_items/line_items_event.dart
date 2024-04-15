import 'package:mobile_client/src/domain/entities/line_item.dart';

abstract class LineItemsEvent {
  const LineItemsEvent();
}

class GetLineItems extends LineItemsEvent {
  const GetLineItems();
}
