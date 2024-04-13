import 'package:dio/dio.dart';
import 'package:mobile_client/config/constants/constants.dart';
import 'package:retrofit/retrofit.dart';

import '../../../models/tutorial/article.dart';
part 'article_api_service.g.dart';

// ISSUE: Đổi tên service theo cái tên cái Button mà mình ấn để gọi cái service ấy
@RestApi(baseUrl: articleAPIBaseURL)
abstract class ArticleApiService {
  factory ArticleApiService(Dio dio) = _ArticleApiService;
  @GET("/top-headlines")
  Future<HttpResponse<List<ArticleModel>>> getArticles({
    @Query("apiKey") String? apiKey,
    @Query("country") String? country,
    @Query("category") String? category,
  });

  /// HINT: Nếu có model nào cũng muốn dùng chung cái service này thì có thể
  //  HINT: khai báo tương tự như trên
}
