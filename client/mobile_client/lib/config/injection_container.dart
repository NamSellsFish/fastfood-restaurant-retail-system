import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:mobile_client/src/data/datasources/tutorial/remote/article_api_service.dart';
import 'package:mobile_client/src/data/repository/tutorial/article_repository_impl.dart';
import 'package:mobile_client/src/domain/repository/tutorial/article_repository.dart';
import 'package:mobile_client/src/domain/use_cases/tutorial/get_articles.dart';
import 'package:mobile_client/src/presentation/bloc/tutorial/article/remote/remote_articles_bloc.dart';

final sl = GetIt.instance;

Future<void> initializeDependencies() async {
  sl.registerSingleton<Dio>(Dio());

  sl.registerSingleton<ArticleApiService>(ArticleApiService(sl()));

  sl.registerSingleton<ArticleRepository>(ArticleRepositoryImpl(sl()));

  sl.registerSingleton<GetArticlesUseCase>(GetArticlesUseCase(sl()));

  // HINT: View model tạo ra 1 instance mới mỗi lần state thay đổi, nên dùng factory
  sl.registerFactory<RemoteArticlesBloc>(() => RemoteArticlesBloc(sl()));
}
