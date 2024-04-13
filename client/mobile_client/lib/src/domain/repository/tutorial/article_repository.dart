import '../../../util/data_state.dart';
import '../../entities/tutorial/article.dart';

abstract class ArticleRepository {
  Future<DataState<List<ArticleEntity>>> getArticles();
}
