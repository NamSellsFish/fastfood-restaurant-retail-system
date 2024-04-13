import 'package:bloc/bloc.dart';

import '../../../../../domain/use_cases/tutorial/get_articles.dart';
import '../../../../../util/data_state.dart';
import 'remote_articles_event.dart';
import 'remote_articles_state.dart';

// TODO 7: Implement bloc (nguyên lí tương tự như 1 cái ViewModel)
class RemoteArticlesBloc
    extends Bloc<RemoteArticlesEvent, RemoteArticlesState> {
  final GetArticlesUseCase _getArticlesUseCase;

  RemoteArticlesBloc(this._getArticlesUseCase)
      : super(const RemoteArticlesLoading()) {
    on<GetArticles>(onGetArticles);

    /// HINT: You can register more events here related to UI
    //  HINT: For example:
    //  HINT: on<YourUIEvent>(onYourUIEvent);
  }

  void onGetArticles(
      GetArticles event, Emitter<RemoteArticlesState> emit) async {
    final dataState = await _getArticlesUseCase();

    if (dataState is DataSuccess && dataState.data!.isNotEmpty) {
      emit(RemoteArticlesDone(dataState.data!));
    }

    if (dataState is DataFailed) {
      emit(RemoteArticlesError(dataState.error!));
    }
  }
}
