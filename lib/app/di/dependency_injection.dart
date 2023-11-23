part of 'index.dart';

GetIt injection = GetIt.instance;

class DependencyInjection {
  static Future<void> setup() async {
    //! -------------------- Core ---------------------
    // injection.registerSingleton(Dio());
    // injection.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl());
    // injection.registerLazySingleton<NetworkToolInterface>(() => DioNetworkTool());

    //! ----------------- DataSources -----------------
    // injection.registerLazySingleton<AuthRemoteDataSource>(() => AuthRemoteDataSourceImpl());

    //! ----------------- Repositories -----------------
    // injection.registerLazySingleton<AuthRepositoryInterface>(() => AuthRepositoryImpl());

    //! ------------------- UseCases -------------------
    //? -------------------- Auth ----------------------
    // injection.registerLazySingleton(() => LoginUseCase());

    //! Utils
    injection.registerLazySingleton<NavigationService>(() => GO());
  }
}
