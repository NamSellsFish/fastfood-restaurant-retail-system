
import 'package:flutter_amazon_clone_bloc/src/data/models/product.dart';
import 'package:flutter_amazon_clone_bloc/src/data/repositories/user_repository.dart';
import 'package:flutter_amazon_clone_bloc/src/logic/blocs/cart/cart_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:mocktail/mocktail.dart';
import 'search_bloc_test.dart';
import 'test_resources.dart';

class MockUserRepository extends Mock implements UserRepository {}
class TestCart {
  List<Product> products = [];
  List<int> quantities = [];

  List<List<dynamic>> get items => [products, quantities];
}

class TestCartInfo {
  double sum = 0;
  List<Product> products = [];
  List<double> averageRatingList = [];
  List<int> quantities = [];
  List<Product> saveForLaterProducts = [];

  List<dynamic> get items => [sum, products, averageRatingList, quantities, saveForLaterProducts];
}

void main() async {

  final user = await testResources.customer;

  registerFallbackValue(user);

  group(CartBloc, () {
    late CartBloc bloc;

    final TestCart testCart = TestCart();
    final TestCartInfo testCartInfo = TestCartInfo();

    final userRepo = MockUserRepository();
    final accountRepo = MockAccountRepository();

    testCart.products = [testResources.product];
    testCart.quantities = [3];

    testCartInfo.sum = testResources.product.price * testCart.quantities[0];
    testCartInfo.products = testCart.products;
    testCartInfo.quantities = testCart.quantities;
    testCartInfo.saveForLaterProducts = [testResources.product];
    const rating = 5.0;
    testCartInfo.averageRatingList = [rating];

    when(() => userRepo.getCart()).thenAnswer((_) async => testCart.items);
    when(() => userRepo.getSaveForLater()).thenAnswer((_) async => testCartInfo.saveForLaterProducts);
    when(() => accountRepo.getAverageRating(any())).thenAnswer((_) async => rating);

    setUp(() => bloc = CartBloc.createInjected(userRepo, accountRepo));
  
    blocTest<CartBloc, CartState>(
      'Get cart:'
      'Emits [CartLoadingS, CartSuccessS]'
      'When GetCartPressed is added.',
      build: () => bloc,
      act: (bloc) => bloc.add(GetCartPressed()),
      expect: () => <CartState>[
        CartLoadingS(),
        CartProductSuccessS(
          total: testCartInfo.sum,
          cartProducts: testCartInfo.products,
          averageRatingList: testCartInfo.averageRatingList,
          productsQuantity: testCartInfo.quantities,
          saveForLaterProducts: testCartInfo.saveForLaterProducts
        )
      ],
    );
  
  });  
}