import 'package:mobile_client/src/domain/entities/line_item.dart';

abstract class LineItemEntityEvent {
  const LineItemEntityEvent();
}

class GetLineItems extends LineItemEntityEvent {
  const GetLineItems();
}
