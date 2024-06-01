import 'dart:ui';

import 'package:flutter/widgets.dart';
import 'package:fast_food_plus/src/data/datasources/api/admin_api.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'test_resources.dart';

void main() async {
  // Initialization
  WidgetsFlutterBinding.ensureInitialized();
  DartPluginRegistrant.ensureInitialized();
  SharedPreferences.setMockInitialValues({});

  // Warning: code that causes changes to the DB will affect the real DB when using unmocked http.Client.
  AdminApi realAdminApi = AdminApi();

  final prefs = await SharedPreferences.getInstance();

  // Clear shared preferences after each test
  tearDown(() {
    prefs.setString('x-auth-token', '');
  });

  final testProduct = testResources.product;
  final testOffer = testResources.offer;

  final tokens = [
    testResources.invalidToken,
    await testResources.customerToken
  ];

  group('Real admin api test', () {
    test('Admin Operations with invalid tokens return 401', () async {
      final responses = {
        realAdminApi.adminAddProduct.toString(): () =>
            realAdminApi.adminAddProduct(product: testProduct),
        realAdminApi.adminDeleteProduct.toString(): () =>
            realAdminApi.adminDeleteProduct(product: testProduct),
        realAdminApi.adminGetCategoryProducts.toString(): () =>
            realAdminApi.adminGetCategoryProducts(category: 'category'),
        realAdminApi.adminGetOrders.toString(): () =>
            realAdminApi.adminGetOrders(),
        realAdminApi.addFourImagesOffer.toString(): () =>
            realAdminApi.addFourImagesOffer(fourImagesOffer: testOffer),
        realAdminApi.adminChangeOrderStatus.toString(): () =>
            realAdminApi.adminChangeOrderStatus(orderId: 'orderId', status: 0),
        realAdminApi.adminDeleteFourImagesOffer.toString(): () =>
            realAdminApi.adminDeleteFourImagesOffer(offerId: 'offerId'),
        realAdminApi.adminGetAnalytics.toString(): () =>
            realAdminApi.adminGetAnalytics(),
      };

      final errors = await checkStatusCodeWithToken(tokens, responses, 401);

      expect(errors, isEmpty);
    });

    test('Operations requiring a valid token return 401.', () async {
      final responses = {
        realAdminApi.getFourImagesOffer.toString(): () =>
            realAdminApi.getFourImagesOffer()
      };

      final errors = await checkStatusCodeWithToken(
          [testResources.invalidToken], responses, 401);

      expect(errors, isEmpty);
    });
  });
}
