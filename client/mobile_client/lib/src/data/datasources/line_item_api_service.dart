import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../../../config/constants/constants.dart';
import '../models/line_item.dart';
part 'line_item_api_service.g.dart';

@RestApi(baseUrl: testApiBaseUrl)
abstract class LineItemApiService {
  factory LineItemApiService(Dio dio, {String baseUrl}) = _LineItemApiService;
  @GET("/line-items")
  Future<HttpResponse<List<LineItemModel>>> getLineItems();
}
