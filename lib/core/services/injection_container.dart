import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

Future<void> init() async {
  // sl
  //   // App Logic
  //   ..registerFactory(
  //     () => LoginNotifier(
  //       signInUseCase: sl(),
  //       getIsLoggedIn: sl(),
  //       setIsLoggedIn: sl(),
  //     ),
  //   )
  //
  //   // Use cases
  //   ..registerLazySingleton(() => SignIn(sl()))
  //   ..registerLazySingleton(() => GetIsLoggedIn(sl()))
  //   ..registerLazySingleton(() => SetIsLoggedIn(sl()))
  //
  //   // Repositories
  //   ..registerLazySingleton<AuthenticationRepository>(
  //     () => AuthenticationRepoImplementation(sl(), sl()),
  //   )
  //
  //   // Data Sources
  //   ..registerLazySingleton<AuthenticationRemoteDataSource>(
  //     () => AuthenticationRDSImplementation(sl()),
  //   )
  //   ..registerLazySingleton<AuthenticationLocalDataSource>(
  //     () => AuthenticationLDSImplementation(
  //       sharedPreferences: sl<SharedPreferences>(),
  //     ),
  //   )
  //
  //   // External Dependencies
  //   ..registerLazySingleton(() => FirebaseAuth.instance)
  //   ..registerLazySingletonAsync<SharedPreferences>(
  //     SharedPreferences.getInstance,
  //   );
  // await sl.isReady<SharedPreferences>();
}
