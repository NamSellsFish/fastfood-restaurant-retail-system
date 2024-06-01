import 'package:fast_food_plus/src/data/repositories/account_repository.dart';
import 'package:fast_food_plus/src/data/repositories/products_repository.dart';
import 'package:fast_food_plus/src/logic/blocs/search/bloc/search_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:mocktail/mocktail.dart';
import 'test_resources.dart';

class MockProductsRepository extends Mock implements ProductsRepository {}

class MockAccountRepository extends Mock implements AccountRepository {}

void main() async {
  registerFallbackValue(testResources.product);

  group(SearchBloc, () {
    late SearchBloc bloc;
    late SearchBloc badBloc;

    final searchRepo = MockProductsRepository();
    final accountRepo = MockAccountRepository();

    final productList = [testResources.product];
    const ratingValue = 5.0;

    when(() => searchRepo.searchProducts(any()))
        .thenAnswer((_) async => productList);
    when(() => accountRepo.getAverageRating(any()))
        .thenAnswer((_) async => ratingValue);

    setUp(() {
      bloc = SearchBloc.createInjected(searchRepo, accountRepo);
      badBloc =
          SearchBloc.createInjected(MockProductsRepository(), accountRepo);
    });

    blocTest<SearchBloc, SearchState>(
      'Search for products:'
      'Emits [SearchLoading, SearchSuccessS]'
      'When SearchProductsEvent is added.',
      build: () => bloc,
      act: (bloc) => bloc.add(const SearchEvent(searchQuery: 'query')),
      expect: () => <SearchState>[
        SearchLoadingS(),
        SearchSuccessS(
            searchProducts: productList, averageRatingList: const [ratingValue])
      ],
    );

    blocTest<SearchBloc, SearchState>(
      'Search for products:'
      'Emits [SearchLoading, SearchErrorS]'
      'When an Exception is thrown.',
      build: () => badBloc,
      act: (bloc) => bloc.add(const SearchEvent(searchQuery: 'query')),
      expect: () => [
        SearchLoadingS(),
        isA<SearchErrorS>(),
      ],
    );
  });
}
