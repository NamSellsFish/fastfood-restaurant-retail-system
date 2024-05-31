import 'package:fast_food_plus/src/data/models/four_images_offer.dart';
import 'package:fast_food_plus/src/data/models/product.dart';
import 'package:fast_food_plus/src/data/models/user.dart';
import 'package:fast_food_plus/src/data/repositories/auth_repository.dart';
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// Checks if the status code of the [futureResponses] is equal to [statusCode] using various token types.
Future<StringBuffer> checkStatusCodeWithToken(
    Iterable<(String type, String token)> tokenInfos,
    Map<String, Future<Response> Function()> futureResponses,
    int statusCode) async {
  final errors = StringBuffer();

  for (var tokenInfo in tokenInfos) {
    // Set the authentication token in shared preferences
    (await SharedPreferences.getInstance())
        .setString('x-auth-token', tokenInfo.$2);

    for (var funcName in futureResponses.keys) {
      final response = await futureResponses[funcName]!();
      if (response.statusCode != statusCode) {
        errors.writeln(
            '$funcName when using token of type ${tokenInfo.$1} returned ${response.statusCode} instead of 401.');
      }
    }
  }

  return errors;
}

/// Compares two maps without considering the keys in [ignoredKeys]
bool compareWithout(Map<String, dynamic> map1, Map<String, dynamic> map2,
    List<String> ignoredKeys) {
  for (var map in [map1, map2]) {
    for (var key in ignoredKeys) {
      map.remove(key);
    }
  }

  for (var key in map1.keys) {
    if (map1[key] != map2[key]) {
      return false;
    }
  }

  return true;
}

/// Singleton class containing test resources
class TestResources {
  TestResources._ctr();

  static final TestResources _instance = TestResources._ctr();

  final AuthRepository authRepo = AuthRepository();

  /// Returns an invalid token
  (String type, String token) get invalidToken => ('invalidToken', '');

  (String email, String password) get customerCredentials =>
      ('khoa@khoa.com', '123456');

  (String email, String password) get adminCredentials =>
      ('admin@admin.com', '123456');

  /// Returns a valid customer token
  Future<(String type, String token)> get customerToken async {
    final result = await authRepo.signInUser(
        customerCredentials.$1, customerCredentials.$2);
    return (result.type, result.token);
  }

  Future<User> get customer async =>
      await authRepo.signInUser(customerCredentials.$1, customerCredentials.$2);

  /// Returns a valid seller token
  Future<(String type, String token)> get sellerToken async {
    final result =
        await authRepo.signInUser(adminCredentials.$1, adminCredentials.$2);
    return (result.type, result.token);
  }

  /// Returns a valid admin token
  Future<(String type, String token)> get adminToken async {
    final result = (await authRepo.signInUser('admin@admin.com', '123456'));
    return (result.type, result.token);
  }

  final product = const Product(
      id: 'id',
      name: 'name',
      description: 'description',
      quantity: 50,
      images: [],
      category: 'category',
      price: 10,
      rating: []);

  final offer = const FourImagesOffer(
      title: 'title', images: [], labels: [], category: 'category');
}

TestResources get testResources => TestResources._instance;
