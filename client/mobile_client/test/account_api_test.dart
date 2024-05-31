import 'dart:ui';

import 'package:fast_food_plus/src/data/datasources/api/account_apis.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'test_resources.dart';

void main() async {
  // Initialization
  WidgetsFlutterBinding.ensureInitialized();
  DartPluginRegistrant.ensureInitialized();
  SharedPreferences.setMockInitialValues({});

  // Warning: code that causes changes to the DB will affect the real DB when using unmocked http.Client.
  AccountApis realAccountApis = AccountApis();

  final prefs = await SharedPreferences.getInstance();

  // Clear shared preferences after each test
  tearDown(() {
    prefs.setString('x-auth-token', '');
  });

  final testProduct = testResources.product;

  final tokens = [testResources.invalidToken];

  group('Real account api test', () {
    test('Invalid tokens return 401', () async {
      final i = realAccountApis;

      final responses = {
        i.addKeepShoppingFor.toString(): () =>
            i.addKeepShoppingFor(product: testProduct),
        i.addToWishList.toString(): () => i.addToWishList(product: testProduct),
        i.deleteFromWishList.toString(): () =>
            i.deleteFromWishList(product: testProduct),
        i.fetchMyOrders.toString(): () => i.fetchMyOrders(),
        i.getAverageRating.toString(): () =>
            i.getAverageRating(testProduct.id!),
        i.getKeepShoppingFor.toString(): () => i.getKeepShoppingFor(),
        i.getProductRating.toString(): () => i.getProductRating(testProduct),
        i.getWishList.toString(): () => i.getWishList(),
        i.isWishListed.toString(): () => i.isWishListed(product: testProduct),
        i.rateProduct.toString(): () =>
            i.rateProduct(product: testProduct, rating: 0),
        i.searchOrders.toString(): () => i.searchOrders('invalidQueryText')
      };

      final errors = await checkStatusCodeWithToken(tokens, responses, 401);

      expect(errors, isEmpty);
    });

    test('Empty query returns 404', () async {
      final i = realAccountApis;

      final responses = {i.searchOrders.toString(): () => i.searchOrders('')};

      final errors = await checkStatusCodeWithToken(tokens, responses, 404);

      expect(errors, isEmpty);
    });
  });
}
