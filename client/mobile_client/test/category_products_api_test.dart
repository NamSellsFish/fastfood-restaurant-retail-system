import 'dart:ui';

import 'package:flutter/widgets.dart';
import 'package:flutter_amazon_clone_bloc/src/data/datasources/api/category_products_api.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';


void main() async {

  // Initialization
  WidgetsFlutterBinding.ensureInitialized();
  DartPluginRegistrant.ensureInitialized();
  SharedPreferences.setMockInitialValues({});

  CategoryProductsApi api = CategoryProductsApi();

  final prefs = await SharedPreferences.getInstance();
  
  prefs.setString('x-auth-token', '');
  
  test('Category fetch response 401', () async {

    final res = await api.fetchCategoryProducts('');

    expect(res.statusCode, 401);

  });
}