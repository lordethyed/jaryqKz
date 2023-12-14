import 'package:flutter/material.dart';
import 'package:jaryq_kz/src/core/constants/colors.dart';
import 'package:jaryq_kz/src/data/models/article_models.dart';
import 'package:jaryq_kz/src/data/models/salah_card_model.dart';
import 'package:jaryq_kz/src/domain/usecases/salah_usecases.dart';
import 'package:jaryq_kz/src/presentations/pages/salah/widgets/article_tile.dart';
import 'package:jaryq_kz/src/presentations/pages/salah/widgets/salah_tile.dart';

class SalahPage extends StatefulWidget {
  const SalahPage({super.key, required this.salahUseCase});
  final SalahUseCase salahUseCase;

  @override
  State<SalahPage> createState() => _SalahPageState();
}

class _SalahPageState extends State<SalahPage> {
  bool _isSalahCardLoaded = false;
  late List<SalahCard> _salahCardsList;
  bool isMan = true;

  final List<Article> _articles = <Article>[
    Article(
      imageUrl:
          "https://islam.muftyat.kz/media/islam/images/uploads/804233cb3e0a11ac4a00d839b039657d.jpg",
      title: "Ғұсыл туралы",
      description: "Ғұсыл дегеніміз не және оны не үшін алады?",
      articleUrl: "https://islam.muftyat.kz/kk/gibadat/gusyl-tolyk-shomylu/",
    ),
    Article(
      imageUrl:
          "https://islam.muftyat.kz/media/islam/images/uploads/6125346582337f1946ac5a1bd70c66bb.jpg",
      title: "Намаздың түрлері",
      description: "Аллаға құлшылық қылу. Бес парыздың біреуі",
      articleUrl: "https://islam.muftyat.kz/kk/gibadat/namazdyn-turleri/",
    ),
    Article(
      imageUrl:
          "https://islam.muftyat.kz/media/islam/images/uploads/bec366f11fe792e40d20143c8ecbd62a.jpg",
      title: "Намаздың парыздары",
      description: "Аллаға құлшылық қылу. Бес парыздың біреуі",
      articleUrl: "https://islam.muftyat.kz/kk/gibadat/namazdyn-paryzdary/",
    ),
    Article(
      imageUrl:
          "https://islam.muftyat.kz/media/islam/images/uploads/c0a083fa7218ba6f5ea8c906ec4bcba2.jpg",
      title: "Дәрет",
      description: "ДӘРЕТ АЛУДЫҢ МАҢЫЗЫ, ПАРЫЗДАРЫ, СҮННЕТТЕРІ МЕН ӘДЕПТЕРІ...",
      articleUrl: "https://islam.muftyat.kz/kk/gibadat/dret-aludyn-manyzy-paryzdary-sunnetteri-men-depter/",
    ),
    Article(
      imageUrl:
          "https://i.ytimg.com/vi/ZkcGX2fuR0c/sddefault.jpg",
      title: "Дәретті бұзбайтын нәрселер",
      description: "Дәретті бұзбайтын нәрселер",
      articleUrl: "https://namaz.muftyat.kz/kk/daret-zhane-tazalyq/?article=dretti-buzbaityn-nrseler",
    ),
  ];

  void getSalahCards() async {
    try {
      List<SalahCard>? salahCardsList =
          await widget.salahUseCase.getSalahCards(isMan);
      setState(() {
        _salahCardsList = salahCardsList!;
        _isSalahCardLoaded = true;
      });
    } catch (e) {
      rethrow;
    }
  }

  @override
  void initState() {
    getSalahCards();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Row(
                  children: [
                    Text("Мақалалар"),
                    Spacer(),
                    CircleAvatar(
                      backgroundColor: AppColor.kGreyColor,
                    )
                  ],
                ),
                SizedBox(
                  height: 430,
                  child: ListView.builder(
                    itemBuilder: (context, index) => ArticleTile(
                      article: _articles[index],
                    ),
                    itemCount: _articles.length,
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                const Text("Намаз оқып үйрену"),
                SizedBox(
                    height: 220,
                    width: MediaQuery.sizeOf(context).width,
                    child: _isSalahCardLoaded
                        ? ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) => SalahTile(
                              salahCard: _salahCardsList[index],
                            ),
                            itemCount: _salahCardsList.length,
                          )
                        : const Center(
                            child: CircularProgressIndicator(),
                          )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
