import 'package:mobile_client/src/domain/entities/tutorial/article.dart';
import 'package:mobile_client/src/util/data_state.dart';

import '../../../util/use_case.dart';
import '../../repository/tutorial/article_repository.dart';

class GetArticlesUseCase
    implements UseCase<DataState<List<ArticleEntity>>, void> {
  final ArticleRepository _articleRepository;
  GetArticlesUseCase(this._articleRepository);

  /// HINT: Nơi tập kết của nhiều use case cùng 1 family (bằng cách overload hàm execute).
  // HINT: Ví dụ như duyệt cây thì sẽ có duyệt dưới lên trên, trên xuống dưới,
  // HINT: trái qua phải, phải qua trái
  @override
  Future<DataState<List<ArticleEntity>>> call({void params}) {
    return _articleRepository.getArticles();
  }
}
