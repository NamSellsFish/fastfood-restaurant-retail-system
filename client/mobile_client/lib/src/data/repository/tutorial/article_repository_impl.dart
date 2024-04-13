import 'dart:io';

import 'package:dio/dio.dart';
import 'package:mobile_client/src/data/datasources/tutorial/remote/article_api_service.dart';
import 'package:mobile_client/src/domain/repository/tutorial/article_repository.dart';

import '../../../../config/constants/constants.dart';
import '../../../util/data_state.dart';
import '../../models/tutorial/article.dart';

class ArticleRepositoryImpl implements ArticleRepository {
  final ArticleApiService _articleApiService;
  ArticleRepositoryImpl(this._articleApiService);
  @override
  Future<DataState<List<ArticleModel>>> getArticles() async {
    try {
      // TODO 4: implement getArticles
      final httpResponse = await _articleApiService.getArticles(
        apiKey: API_KEY,
        country: COUNTRY_QUERY,
        category: CATEGORY_QUERY,
      );

      if (httpResponse.response.statusCode == HttpStatus.ok) {
        return DataSuccess(httpResponse.data);
      } else {
        return DataFailed(DioException(
            requestOptions: httpResponse.response.requestOptions,
            response: httpResponse.response,
            type: DioExceptionType.badResponse,
            error: httpResponse.response.statusMessage));
      }
    } on DioException catch (e) {
      return DataFailed(e);
    }
  }
}
