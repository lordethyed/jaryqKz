import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:jaryq_kz/src/domain/usecases/books_usecase.dart';
import 'package:jaryq_kz/src/domain/usecases/questions_usecase.dart';
import 'package:jaryq_kz/src/domain/usecases/salah_usecases.dart';
import 'package:jaryq_kz/src/domain/usecases/time_usecase.dart';
import 'package:jaryq_kz/src/presentations/pages/home/home_page.dart';

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final sl = GetIt.instance;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Jaryq Kz',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: HomePage(
        questionsUseCase: sl<QuestionsUseCase>(),
        salahUseCase: sl<SalahUseCase>(),
        booksUseCase: sl<BooksUseCase>(),
        timeUseCase: sl<TimeUseCase>(),
      ),
    );
  }
}
