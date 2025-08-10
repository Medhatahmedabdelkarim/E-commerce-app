import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import '../data/data_sources/local/cart_local_data_source.dart';
import '../data/data_sources/local/favorites_local_data_source.dart';
import '../data/data_sources/remote/products_remote_source.dart';
import '../data/repositories/cart_repository_impl.dart';
import '../data/repositories/favorites_repository_impl.dart';
import '../data/repositories/products_repository_impl.dart';
import '../domain/UseCases/cart_use_cases.dart';
import '../domain/UseCases/favorites_use_cases.dart';
import '../domain/UseCases/products_use_case.dart';
import '../domain/repositories/cart_repository.dart';
import '../domain/repositories/favorites_repository.dart';
import '../domain/repositories/product_repository.dart';
import '../presentation/cart/manager/cart_bloc.dart';
import '../presentation/favorites/manager/favorites_bloc.dart';
import '../presentation/home/manager/home_bloc.dart';
import '../presentation/product_details/manager/product_details_bloc.dart';
import 'api_services.dart';
import 'local_storage.dart';

final sl = GetIt.instance;

Future<void> ServiceLocator() async {
  // Services
  sl.registerLazySingleton<LocalStorageServices>(
    () => LocalStorageServices(itemsKey: '', key: ''),
  );

  sl.registerLazySingleton(
    () => ApiService(Dio(BaseOptions(contentType: "application/json"))),
  );

  // Data Sources
  sl.registerLazySingleton<ProductRemoteDataSource>(
    () => ProductRemoteDataSourceImpl(sl()),
  );

  sl.registerLazySingleton<CartLocalDataSource>(
    () => CartLocalDataSource(sl()),
  );
  sl.registerLazySingleton<FavoritesLocalDataSource>(
        () => FavoritesLocalDataSource(sl()),
  );

  // Repositories
  sl.registerLazySingleton<ProductRepository>(
    () => ProductRepositoryImpl(sl()),
  );
  sl.registerLazySingleton<FavoritesRepository>(
    () => FavoritesRepositoryImpl(sl()),
  );
  sl.registerLazySingleton<CartRepository>(() => CartRepositoryImpl(sl()));

  // Use Cases
  sl.registerLazySingleton(() => GetProductsUseCase(sl()));
  sl.registerLazySingleton<AddToCartUseCase>(() => AddToCartUseCase(sl()));
  sl.registerLazySingleton<RemoveFromCartUseCase>(
    () => RemoveFromCartUseCase(sl()),
  );
  sl.registerLazySingleton<ClearCartUseCase>(() => ClearCartUseCase(sl()));
  sl.registerLazySingleton<DeleteSpecificProductUseCase>(
    () => DeleteSpecificProductUseCase(sl()),
  );
  sl.registerLazySingleton<GetTotalPriceUseCase>(() => GetTotalPriceUseCase());
  sl.registerLazySingleton<LoadCartUseCase>(() => LoadCartUseCase(sl()));
  sl.registerLazySingleton(() => GetProductByIdUseCase(sl()));
  sl.registerLazySingleton(() => AddToFavoritesUseCase(sl()));
  sl.registerLazySingleton(() => RemoveFromFavoritesUseCase(sl()));
  sl.registerLazySingleton(() => LoadFavoritesUseCase(sl()));


  // BLoCs
  sl.registerFactory<CartBloc>(
    () => CartBloc(
      addToCartUseCase: sl(),
      removeFromCartUseCase: sl(),
      clearCartUseCase: sl(),
      deleteProductUseCase: sl(),
      loadCartUseCase: sl(),
      getTotalPriceUseCase: sl(),
    ),
  );
  sl.registerFactory<HomeBloc>(() => HomeBloc(sl()));
  sl.registerFactory<ProductDetailsBloc>(() => ProductDetailsBloc(sl()));
  sl.registerFactory<FavoritesBloc>(
    () => FavoritesBloc(
      addToFavoritesUseCase: sl(),
      removeFromFavoritesUseCase: sl(), loadFavoritesUseCase: sl(),
    ),
  );
}
