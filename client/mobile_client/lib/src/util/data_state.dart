import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:mobile_client/src/data/models/line_item.dart';

enum StateStatus { initial, loading, success, failure }

abstract class DataState<T> extends Equatable {
  final T? data;
  final DioException? error;
  final StateStatus status;

  const DataState({this.data, this.error, this.status = StateStatus.initial});
  @override
  List<Object> get props => [data!, error!];
}

// Network state
class DataApiCallSuccess<T> extends DataState<T> {
  const DataApiCallSuccess(T data)
      : super(data: data, status: StateStatus.success);
}

class DataApiCallFailed<T> extends DataState<T> {
  const DataApiCallFailed(DioException error)
      : super(error: error, status: StateStatus.failure);
}
