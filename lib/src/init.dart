import 'dart:io';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:get_it/get_it.dart';
import 'package:jaryq_kz/src/data/datasources/assets_info.dart';
import 'package:jaryq_kz/src/data/datasources/http_client.dart';
import 'package:jaryq_kz/src/data/datasources/json_client.dart';
import 'package:jaryq_kz/src/data/datasources/local/books_local_datasource.dart';
import 'package:jaryq_kz/src/data/datasources/local/questions_local_datasource.dart';
import 'package:jaryq_kz/src/data/datasources/local/salah_local_datasource.dart';
import 'package:jaryq_kz/src/data/datasources/network_info.dart';
import 'package:jaryq_kz/src/data/datasources/remote/time_remote_datasource.dart';
import 'package:jaryq_kz/src/domain/repositories/books_reposity.dart';
import 'package:jaryq_kz/src/domain/repositories/questions_reposity.dart';
import 'package:jaryq_kz/src/domain/repositories/salah_reposity.dart';
import 'package:jaryq_kz/src/domain/repositories/time_reposity.dart';
import 'package:jaryq_kz/src/domain/usecases/books_usecase.dart';
import 'package:jaryq_kz/src/domain/usecases/questions_usecase.dart';
import 'package:jaryq_kz/src/domain/usecases/salah_usecases.dart';
import 'package:jaryq_kz/src/domain/usecases/time_usecase.dart';

final sl = GetIt.instance;

void init() {
  HttpOverrides.global = MyHttpOverrides();

  sl.registerLazySingleton<MyHttpClient>(() => MyHttpClient());

  sl.registerLazySingleton<Connectivity>(() => Connectivity());
  sl.registerLazySingleton<NetworkInfo>(() => NetworkInfo(sl<Connectivity>())); 

  sl.registerLazySingleton<AssetsInfo>(() => AssetsInfo());

  sl.registerLazySingleton<MyJsonClient>(() => MyJsonClient());

  sl.registerLazySingleton<SalahLocalDataSource>(() => SalahLocalDataSourceImpl(myJsonClient: sl<MyJsonClient>()));
  sl.registerLazySingleton<SalahRepositry>(() => SalahRepositryImpl(salahLocalDataSource: sl<SalahLocalDataSource>(), assetsInfo: sl<AssetsInfo>()));
  sl.registerLazySingleton<SalahUseCase>(() => SalahUseCaseImpl(salahRepositry: sl<SalahRepositry>()));

  sl.registerLazySingleton<BooksLocalDataSource>(() => BooksLocalDataSourceImpl(myJsonClient: sl<MyJsonClient>()));
  sl.registerLazySingleton<BooksReposity>(() => BooksReposityImpl(assetsInfo: sl<AssetsInfo>(), booksLocalDataSource: sl<BooksLocalDataSource>()));
  sl.registerLazySingleton<BooksUseCase>(() => BooksUseCaseImpl(booksReposity: sl<BooksReposity>()));

  sl.registerLazySingleton<TimeRemoteDataSource>(() => TimeRemoteDataSourceImpl(myHttpClient: sl<MyHttpClient>()));
  sl.registerLazySingleton<TimeReposity>(() => TimeReposityImpl(networkInfo: sl<NetworkInfo>(), timeRemoteDataSource: sl<TimeRemoteDataSource>()));
  sl.registerLazySingleton<TimeUseCase>(() => TimeUseCaseImpl(timeReposity: sl<TimeReposity>()));

  sl.registerLazySingleton<QuestionsLocalDataSource>(() => QuestionsLocalDataSourceImpl(myJsonClient: sl<MyJsonClient>()));
  sl.registerLazySingleton<QuestionsReposity>(() => QuestionsReposityImpl(assetsInfo: sl<AssetsInfo>(), questionsLocalDataSource: sl<QuestionsLocalDataSource>()));
  sl.registerLazySingleton<QuestionsUseCase>(() => QuestionsUseCaseImpl(questionsReposity: sl<QuestionsReposity>()));
}
