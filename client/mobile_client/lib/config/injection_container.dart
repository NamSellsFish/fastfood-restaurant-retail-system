import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import '../src/data/datasources/line_item_api_service.dart';
import '../src/data/repository/line_item_repository_impl.dart';
import '../src/domain/repository/line_item_repository.dart';
import '../src/domain/use_cases/get_line_items.dart';
import '../src/presentation/bloc/line_items/line_item_entity_bloc.dart';

final sl = GetIt.instance;

Future<void> initializeDependencies() async {
  sl.registerSingleton<Dio>(Dio());
  // Line Item
  sl.registerSingleton<LineItemApiService>(LineItemApiService(sl()));

  sl.registerSingleton<LineItemRepository>(LineItemRepositoryImpl(sl()));

  sl.registerSingleton<GetLineItemsUseCase>(GetLineItemsUseCase(sl()));

  sl.registerFactory<LineItemEntityBloc>(() => LineItemEntityBloc(sl()));
}
