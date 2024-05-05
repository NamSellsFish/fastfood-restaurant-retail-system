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
      List<Product> tempKeepShoppingForList;
      List<Product> keepShoppingForList;
      List<double> averageRatingList = [];
      double rating;

      tempKeepShoppingForList = await accountRepository.getKeepShoppingFor();

      keepShoppingForList = tempKeepShoppingForList.reversed.toList();

      for (int i = 0; i < keepShoppingForList.length; i++) {
        rating = await accountRepository
            .getAverageRating(keepShoppingForList[i].id!);

        averageRatingList.add(rating);
      }

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
