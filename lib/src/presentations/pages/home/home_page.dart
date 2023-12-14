import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:jaryq_kz/src/core/constants/assets.dart';
import 'package:jaryq_kz/src/core/constants/colors.dart';
import 'package:jaryq_kz/src/domain/usecases/books_usecase.dart';
import 'package:jaryq_kz/src/domain/usecases/questions_usecase.dart';
import 'package:jaryq_kz/src/domain/usecases/salah_usecases.dart';
import 'package:jaryq_kz/src/domain/usecases/time_usecase.dart';
import 'package:jaryq_kz/src/presentations/pages/books/books_page.dart';
import 'package:jaryq_kz/src/presentations/pages/information/information_page.dart';
import 'package:jaryq_kz/src/presentations/pages/questions/questions_page.dart';
import 'package:jaryq_kz/src/presentations/pages/salah/salah_page.dart';
import 'package:jaryq_kz/src/presentations/pages/time/time_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.salahUseCase, required this.booksUseCase, required this.timeUseCase, required this.questionsUseCase});
  final SalahUseCase salahUseCase;
  final BooksUseCase booksUseCase;
  final TimeUseCase timeUseCase;
  final QuestionsUseCase questionsUseCase;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<BottomNavigationBarItem> _items = <BottomNavigationBarItem>[
    BottomNavigationBarItem(
        icon: SvgPicture.asset(AppAssets.svg.salah),
        label: "Намаз",
        activeIcon: SvgPicture.asset(AppAssets.svg.salahActive)),
    BottomNavigationBarItem(
        icon: SvgPicture.asset(AppAssets.svg.book),
        label: "Кітаптар",
        activeIcon: SvgPicture.asset(AppAssets.svg.bookActive)),
    BottomNavigationBarItem(
        icon: SvgPicture.asset(AppAssets.svg.time),
        label: "Уақыт",
        activeIcon: SvgPicture.asset(AppAssets.svg.timeActive)),
    BottomNavigationBarItem(
        icon: SvgPicture.asset(AppAssets.svg.question),
        label: "Сұрақ",
        activeIcon: SvgPicture.asset(AppAssets.svg.questionActive)),
    BottomNavigationBarItem(
        icon: SvgPicture.asset(AppAssets.svg.info),
        label: "Біз жайлы",
        activeIcon: SvgPicture.asset(AppAssets.svg.infoActive))
  ];

  int _currentIndex = 0;

  void _changeIndexMethod(int newIndex) {
    setState(() {
      _currentIndex = newIndex;
    });
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> widgetOptions = <Widget>[
      SalahPage(
        salahUseCase: widget.salahUseCase,
      ),
      BooksPage(
        booksUseCase: widget.booksUseCase,
      ),
      TimePage(
        timeUseCase: widget.timeUseCase,
      ),
      QuestionsPage(
        questionsUseCase: widget.questionsUseCase,
      ),
      const InformationPage(),
    ];
    return Scaffold(
      body: widgetOptions.elementAt(_currentIndex),
      bottomNavigationBar: BottomNavigationBar(
        showSelectedLabels: true,
        showUnselectedLabels: true,
        selectedItemColor: Colors.green,
        unselectedItemColor: AppColor.kBottomNavigationGreyColor,
        unselectedLabelStyle: const TextStyle(color: Colors.black),
        selectedLabelStyle: const TextStyle(color: Colors.black),
        currentIndex: _currentIndex,
        onTap: _changeIndexMethod,
        items: _items,
      ),
    );
  }
}
