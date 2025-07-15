import 'package:get_it/get_it.dart';

import '../cart/bloc/cart_bloc.dart';
import 'local_storage.dart';

final GetIt sl = GetIt.instance;

Future<void> ServiceLocator() async {
  // Services
  sl.registerLazySingleton<LocalStorageServices>(() => LocalStorageServices(itemsKey: '', key: ''));

  // BLoCs
  sl.registerFactory<CartBloc>(() => CartBloc());
}