import 'dart:math';

import 'package:flutter_amazon_clone_bloc/src/data/repositories/category_products_repository.dart';
import 'package:flutter_amazon_clone_bloc/src/logic/blocs/category_products/fetch_category_products_bloc/fetch_category_products_bloc.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:mocktail/mocktail.dart';
import 'search_bloc_test.dart';
import 'test_resources.dart';

class MockCategoryProductsRepository extends Mock
    implements CategoryProductsRepository {}

void main() async {
  final categoryRepo = MockCategoryProductsRepository();
  final accountRepo = MockAccountRepository();

  late FetchCategoryProductsBloc bloc;
  final Random random = Random(1);
  const rating = 0.0;
  final productList = [testResources.product, testResources.product];

  bloc = FetchCategoryProductsBloc.createInjected(
      categoryRepo, accountRepo, random);

  when(() => categoryRepo.fetchCategoryProducts(any()))
      .thenAnswer((_) async => productList);
  when(() => accountRepo.getAverageRating(any()))
      .thenAnswer((_) async => rating);

  blocTest<FetchCategoryProductsBloc, FetchCategoryProductsState>(
    'Fetch category products:'
    'Emits [FetchCategoryProductsLoading, FetchCategoryProductsSuccess]'
    'When CategoryPressedEvent is added.',
    build: () => bloc,
    act: (bloc) => bloc.add(const CategoryPressedEvent(category: 'category')),
    expect: () => <FetchCategoryProductsState>[
      FetchCategoryProductsLoadingS(),
      FetchCategoryProductsSuccessS(
        productList: productList,
        averageRatingList: const [rating, rating],
      )
    ],
  );
}
