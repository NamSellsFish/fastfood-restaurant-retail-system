import 'dart:math';

import 'package:bloc/bloc.dart';
import '../../../domain/entities/line_item.dart';
import '../../../domain/entities/product.dart';
import 'line_items_event.dart';
import 'line_items_state.dart';

// TODO 7: Implement bloc (nguyên lí tương tự như 1 cái ViewModel)
class LineItemsBloc extends Bloc<LineItemsEvent, LineItemsState> {
  static const mockStateData = [
    LineItemEntity(
        id: 1,
        product: ProductEntity(id: 1, name: 'Product 1', price: 1.1),
        quantity: 1,
        size: 'M',
        status: false),
    LineItemEntity(
        id: 2,
        product: ProductEntity(id: 2, name: 'Product 2', price: 1.2),
        quantity: 2,
        size: 'S',
        status: false),
    LineItemEntity(
        id: 3,
        product: ProductEntity(id: 3, name: 'Product 3', price: 1.3),
        quantity: 3,
        size: 'L',
        status: false),
  ];

  LineItemsBloc() : super(const LineItemsDone(mockStateData)) {
    on<GetLineItems>(onGetLineItems);

    /// HINT: You can register more events here related to UI
    //  HINT: For example:
    //  HINT: on<YourUIEvent>(onYourUIEvent);
  }

  void onGetLineItems(GetLineItems event, Emitter<LineItemsState> emit) {
    emit(const LineItemsDone(mockStateData));
  }

  // if (dataState is DataSuccess && dataState.data!.isNotEmpty) {
  //   emit(LineItemsDone(dataState.data!));
  // }

  // if (dataState is DataFailed) {
  //   emit(LineItemsError(dataState.error!));
  // }
}
