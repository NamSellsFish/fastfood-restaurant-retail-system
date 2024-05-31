import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import '/src/data/models/product.dart';
import '/src/data/repositories/account_repository.dart';
import '/src/data/repositories/category_products_repository.dart';

part 'fetch_category_products_event.dart';
part 'fetch_category_products_state.dart';

class FetchCategoryProductsBloc
    extends Bloc<FetchCategoryProductsEvent, FetchCategoryProductsState> {
  final CategoryProductsRepository categoryProductRepository;
  final AccountRepository accountRepository;
  final Random random;

  FetchCategoryProductsBloc(categoryProductRepository)
      : this.createInjected(
            categoryProductRepository, AccountRepository(), Random());

  FetchCategoryProductsBloc.createInjected(
      this.categoryProductRepository, this.accountRepository, this.random)
      : super(FetchCategoryProductsLoadingS()) {
    on<FetchCategoryProductsEvent>(_onFetchCategoryProductsHandler);
    on<CategoryPressedEvent>(_onFetchCategoryProductsHandler);
  }

  void _onFetchCategoryProductsHandler(event, emit) async {
    try {
      List<Product> productList;
      List<double> averageRatingList = [];
      double rating;
      emit(FetchCategoryProductsLoadingS());

      productList =
          await categoryProductRepository.fetchCategoryProducts(event.category);
      productList.shuffle(random);

      for (int i = 0; i < productList.length; i++) {
        rating = await accountRepository.getAverageRating(productList[i].id!);
        averageRatingList.add(rating);
      }

      emit(FetchCategoryProductsSuccessS(
          productList: productList, averageRatingList: averageRatingList));
    } catch (e) {
      emit(FetchCategoryProductsErrorS(errorString: e.toString()));
    }
  }
}
