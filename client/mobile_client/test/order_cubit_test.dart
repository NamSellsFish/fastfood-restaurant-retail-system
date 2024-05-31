import 'package:fast_food_plus/src/logic/blocs/order/order_cubit/order_cubit.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:mocktail/mocktail.dart';
import 'cart_bloc_test.dart';
import 'test_resources.dart';

void main() async {
  final user = await testResources.customer;
  registerFallbackValue(user);

  final badUser = user.copyWith(address: '');

  final repo = MockUserRepository();

  final badUserRepo = MockUserRepository();

  when(() => repo.getUserData()).thenAnswer((_) async => user);

  when(() => badUserRepo.getUserData()).thenAnswer((_) async => badUser);

  group(OrderCubit, () {
    blocTest<OrderCubit, OrderState>(
      'Get user data:'
      'Emits [OrderProcessS]'
      'When gPayButton is called with user address.',
      build: () => OrderCubit(repo),
      act: (cubit) => cubit.gPayButton(totalAmount: ''),
      expect: () => [isA<OrderProcessS>()],
    );

    blocTest<OrderCubit, OrderState>(
      'Get user data:'
      'Emits [DisableButtonS]'
      'When gPayButton is called with no user address.',
      build: () => OrderCubit(badUserRepo),
      act: (cubit) => cubit.gPayButton(totalAmount: ''),
      expect: () => [isA<DisableButtonS>()],
    );
  });
}
