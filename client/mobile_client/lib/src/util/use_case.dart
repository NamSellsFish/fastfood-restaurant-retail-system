// TODO 5: 1 template dành cho các use case
abstract class UseCase<Type, Params> {
  /// HINT: Phải đúng là chữ call mới được, flutter nó quy định vậy
  //  HINT: không tin cứ thử đổi chữ khác.
  Future<Type> call({Params params});
}
