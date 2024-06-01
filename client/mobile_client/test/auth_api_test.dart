import 'dart:ui';

import 'package:flutter/widgets.dart';
import 'package:fast_food_plus/src/data/datasources/api/auth_api.dart';
import 'package:fast_food_plus/src/data/repositories/auth_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'test_resources.dart';

void main() async {
  // Initialization
  WidgetsFlutterBinding.ensureInitialized();
  DartPluginRegistrant.ensureInitialized();
  SharedPreferences.setMockInitialValues({});

  // Warning: code that causes changes to the DB will affect the real DB when using unmocked http.Client.
  AuthAPI realAuthApi = AuthAPI();
  AuthRepository realAuthRepository = AuthRepository();

  final prefs = await SharedPreferences.getInstance();

  // Clear shared preferences after each test
  tearDown(() {
    prefs.setString('x-auth-token', '');
  });

  final tokens = [
    await testResources.customerToken,
    await testResources.adminToken
  ];

  final credentialMap = {
    testResources.customerCredentials: testResources.customerToken,
    testResources.adminCredentials: testResources.adminToken
  };

  group('Real auth api test', () {
    test('Token validity test', () async {
      final errors = StringBuffer();

      if (await realAuthRepository.isTokenValid(
          token: testResources.invalidToken.$2)) {
        errors.writeln('Invalid token is valid');
      }

      for (var token in tokens) {
        if (!await realAuthRepository.isTokenValid(token: token.$2)) {
          errors.writeln('Valid token is invalid');
        }
      }
    });

    test('Signing in with wrong username', () async {
      var (email, pass) = testResources.customerCredentials;
      
      try
      {  
        await realAuthRepository.signInUser("_${email}_", pass);
      }
      catch (e)
      {
        return;
      }

      fail('Signing in with wrong username did not throw exception');
    });

    test('Signing in with wrong password', () async {
      var (email, pass) = testResources.customerCredentials;

      try {
        await realAuthRepository.signInUser(email, "_${pass}_");
      } catch (e) {
        return;
      }

      fail('Signing in with wrong password did not throw exception');
    });

    test('Signing in with correct credentials give right user', () async {
      final errors = StringBuffer();

      for (var entry in credentialMap.entries) {
        var (email, pass) = entry.key;
        var token = await entry.value;

        var user = await realAuthRepository.signInUser(email, pass);

        if (user.email != email) {
          errors.writeln('${user.email} is not equal to $email');
        }

        if (user.type != token.$1) {
          errors.writeln('${user.type} is not equal to ${token.$1}');
        }
      }

      expect(errors, isEmpty);
    });
  });
}
