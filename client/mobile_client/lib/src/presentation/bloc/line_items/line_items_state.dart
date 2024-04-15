import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import '../../../domain/entities/line_item.dart';

abstract class LineItemsState extends Equatable {
  final List<LineItemEntity>? lineItems;
  final DioException? error;

  const LineItemsState({this.lineItems, this.error});

  @override
  List<Object?> get props => [lineItems, error];
}

class LineItemsLoading extends LineItemsState {
  const LineItemsLoading();
}

class LineItemsDone extends LineItemsState {
  const LineItemsDone(List<LineItemEntity> lineItems)
      : super(lineItems: lineItems);
}

class LineItemsError extends LineItemsState {
  const LineItemsError(DioException error) : super(error: error);
}
