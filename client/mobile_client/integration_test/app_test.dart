import 'dart:ui';

import 'package:flutter/widgets.dart';
import 'package:flutter_amazon_clone_bloc/main.dart';
import 'package:flutter_amazon_clone_bloc/src/presentation/views/auth/keys.dart'
    as auth_screen_keys;
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  group('Integration tests.', () {
    testWidgets('Login screen', (tester) async {
      // Initialization
      WidgetsFlutterBinding.ensureInitialized();
      DartPluginRegistrant.ensureInitialized();
      SharedPreferences.setMockInitialValues({});
      final binding = IntegrationTestWidgetsFlutterBinding.ensureInitialized();

      await tester.pumpWidget(const MyApp());
      await tester.pumpAndSettle();

      // Logo
      expect(find.byKey(auth_screen_keys.logoKey), findsOneWidget);

      // Create account option
      final createAccountOption = find.byKey(auth_screen_keys.createAccountKey);
      expect(createAccountOption, findsOneWidget);

      // Show fields
      await tester.tap(createAccountOption);
      await tester.pumpAndSettle();

      /*
        Fields:
          - First and last name
          - Email
          - Password
        Button
       */

      for (var key in [
        auth_screen_keys.nameKey,
        auth_screen_keys.setEmailKey,
        auth_screen_keys.setPasswordKey,
        auth_screen_keys.createAccountButtonKey
      ]) {
        expect(find.byKey(key), findsOneWidget);
      }

      // Sign in option
      final signInOption = find.byKey(auth_screen_keys.signInKey);
      expect(signInOption, findsOneWidget);

      // Show fields
      await tester.tap(signInOption);
      await tester.pumpAndSettle();

      /*
        Fields:
          - Email
          - Password
        Button
       */

      for (var key in [
        auth_screen_keys.emailKey,
        auth_screen_keys.passwordKey,
        auth_screen_keys.loginButtonKey
      ]) {
        expect(find.byKey(key), findsOneWidget);
      }

      // Conditions of Use
      // Privacy Notice
      // Help
      // Copyright statement
    });
  });
}
