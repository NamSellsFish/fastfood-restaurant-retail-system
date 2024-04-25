import 'dart:ffi';

import 'package:dio/dio.dart';
import 'package:mobile_client/src/data/models/line_item.dart';
import 'package:mobile_client/src/domain/entities/line_item.dart';

import 'package:mobile_client/src/util/data_state.dart';

import '../../domain/repository/line_item_repository.dart';
import '../datasources/line_item_api_service.dart';

class LineItemRepositoryImpl implements LineItemRepository {
  final LineItemApiService _lineItemApiService;
  LineItemRepositoryImpl(this._lineItemApiService);

  @override
  Future<DataState<List<LineItemEntity>>> getLineItems() async {
    // HINT: Get data from the API service
    try {
      final httpResponse = await _lineItemApiService.getLineItems();

      if (httpResponse.response.statusCode == 200) {
        return DataApiCallSuccess(httpResponse.data);
      } else {
        return DataApiCallFailed(DioException(
            requestOptions: httpResponse.response.requestOptions,
            response: httpResponse.response,
            type: DioExceptionType.badResponse,
            error: httpResponse.response.statusMessage));
      }
    } on DioException catch (e) {
      return DataApiCallFailed(e);
    }
  }
}
