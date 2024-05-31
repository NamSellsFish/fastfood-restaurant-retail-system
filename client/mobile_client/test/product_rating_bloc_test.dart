import 'package:flutter_amazon_clone_bloc/src/data/models/order.dart';
import 'package:flutter_amazon_clone_bloc/src/data/models/product.dart';
import 'package:flutter_amazon_clone_bloc/src/logic/blocs/account/product_rating/product_rating_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:mocktail/mocktail.dart';
import 'search_bloc_test.dart';
import 'test_resources.dart';

class OrderBuilder implements Order {
  @override
  String address = '';
  @override
  String id = '';
  @override
  int orderedAt = 0;
  @override
  List<Product> products = [];

  @override
  List<int> quantity = [];
  @override
  int status = 0;
  @override
  double totalPrice = 0;
  @override
  String userId = '';

  @override
  bool? get stringify => toOrder().stringify;

  @override
  String toJson() => toOrder().toJson();

  @override
  Map<String, dynamic> toMap() => toOrder().toMap();

  @override
  List<Object?> get props => toOrder().props;

  Order toOrder() => Order(
      id: id,
      products: products,
      quantity: quantity,
      address: address,
      userId: userId,
      orderedAt: orderedAt,
      status: status,
      totalPrice: totalPrice);
}

void main() async {
  late ProductRatingBloc bloc;

  registerFallbackValue(testResources.product);

  final repo = MockAccountRepository();
  const rating = 5.0;
  const newRating = 0.0;

  final orderBuilder = OrderBuilder();
  orderBuilder.products = [testResources.product, testResources.product];

  when(() => repo.getProductRating(any())).thenAnswer((_) async => rating);
  
  when(() => repo.rateProduct(product: any(named: 'product'), rating: any(named: 'rating')))
      .thenAnswer((_) async {
        when(() => repo.getProductRating(any())).thenAnswer((_) async => newRating);
      });
  
  setUp(() {
    bloc = ProductRatingBloc(repo);
  });

  final order = orderBuilder.toOrder();

  group(ProductRatingBloc, () {

    blocTest<ProductRatingBloc, ProductRatingState>(
      'Get product ratings:'
      'Emits [GetProductRatingInitialS, GetProductRatingSuccessS]'
      'When GetProductRatingEvent is added.',
      build: () => bloc,
      act: (bloc) => bloc.add(GetProductRatingEvent(order: order)),
      expect: () => [
        isA<GetProductRatingInitialS>(),
        const GetProductRatingSuccessS(ratingsList: [rating, rating])
      ],
    );

    blocTest<ProductRatingBloc, ProductRatingState>(
      'Set product ratings:'
      'Emits [RateProductInitialS, RateProductSuccessS] with correct new values'
      'When RateProductPressedEvent is added.',
      build: () => bloc,
      act: (bloc) => bloc.add(RateProductPressedEvent(order: order, product: testResources.product, rating: newRating)),
      expect: () => [
        const RateProductInitialS(ratingsList: [rating, rating]),
        const RateProductSuccessS(updatedRatingsList: [newRating, newRating])
      ],
    );

  });
}
