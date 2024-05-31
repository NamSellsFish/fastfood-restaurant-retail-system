import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import '/src/data/models/product.dart';
import '/src/data/repositories/account_repository.dart';

part 'keep_shopping_for_state.dart';

class KeepShoppingForCubit extends Cubit<KeepShoppingForState> {
  final AccountRepository accountRepository;
  KeepShoppingForCubit(this.accountRepository)
      : super(KeepShoppingForLoadingS());

  void keepShoppingFor() async {
    try {
      final tempKeepShoppingForList = await accountRepository.getKeepShoppingFor();

      final keepShoppingForList = tempKeepShoppingForList.reversed.toList();

      final averageRatingList = await Future.wait(keepShoppingForList.map(
          (product) => accountRepository.getAverageRating(product.id!)));

      emit(KeepShoppingForSuccessS(
          productList: keepShoppingForList,
          averageRatingList: averageRatingList));
    } catch (e) {
      emit(KeepShoppingForErrorS(errorString: e.toString()));
    }
  }

  void addToKeepShoppingFor({required Product product}) async {
    try {
      accountRepository.addKeepShoppingFor(product: product);

      emit(AddKeepShoppingForSuccessS(product: product));
    } catch (e) {
      emit(AddKeepShoppingForErrorS(errorString: e.toString()));
    }
  }
}
