import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import '/src/data/models/product.dart';
import '/src/data/repositories/account_repository.dart';
import '/src/data/repositories/products_repository.dart';

part 'search_event.dart';
part 'search_state.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  final ProductsRepository searchProductsRepository;
  final AccountRepository accountRepository;

  SearchBloc(ProductsRepository searchProductsRepository)
      : this.createInjected(searchProductsRepository, AccountRepository());

  SearchBloc.createInjected(
      this.searchProductsRepository, this.accountRepository)
      : super(SearchLoadingS()) {
    on<SearchEvent>(_searchEventHandler);
  }

  void _searchEventHandler(event, emit) async {
    try {
      emit(SearchLoadingS());
      List<Product> searchProducts;
      List<double> averageRatingList = [];
      double rating;

      searchProducts =
          await searchProductsRepository.searchProducts(event.searchQuery);

      for (int i = 0; i < searchProducts.length; i++) {
        rating =
            await accountRepository.getAverageRating(searchProducts[i].id!);
        averageRatingList.add(rating);
      }

      emit(SearchSuccessS(
          searchProducts: searchProducts,
          averageRatingList: averageRatingList));
    } catch (e) {
      emit(SearchErrorS(errorString: e.toString()));
    }
  }
}
