import 'package:flutter/material.dart';
import 'package:jaryq_kz/src/data/models/question_model.dart';
import 'package:jaryq_kz/src/domain/usecases/questions_usecase.dart';
import 'package:jaryq_kz/src/presentations/pages/questions/widgets/question_tile.dart';

class QuestionsPage extends StatefulWidget {
  const QuestionsPage({super.key, required this.questionsUseCase});
  final QuestionsUseCase questionsUseCase;

  @override
  State<QuestionsPage> createState() => _QuestionsPageState();
}

class _QuestionsPageState extends State<QuestionsPage>
    with SingleTickerProviderStateMixin {
  bool _isLoaded = false;
  late List<QuestionCategory> _questionCategryList;
  late TabController _tabController;

  void getQuestions() async {
    try {
      List<QuestionCategory> questionCategryList =
          await widget.questionsUseCase.getQuestionsCategory();
      setState(() {
        _questionCategryList = questionCategryList;
        _isLoaded = true;
        _tabController =
            TabController(length: _questionCategryList.length, vsync: this);
      });
    } catch (e) {
      rethrow;
    }
  }

  @override
  void initState() {
    getQuestions();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text('Жиі қойылатын сұрақтар'),
          bottom: _isLoaded
              ? TabBar(
                  isScrollable: true,
                  controller: _tabController,
                  tabAlignment: TabAlignment.center,
                  tabs: List.generate(
                    _questionCategryList.length,
                    (index) => Tab(
                      text: _questionCategryList[index].categoryName,
                    ),
                  ),
                )
              : null),
      body: _isLoaded
          ? Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              child: TabBarView(
                  controller: _tabController,
                  children: List.generate(
                    _questionCategryList.length,
                    (index) => GridView.builder(
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          childAspectRatio: 0.8,
                          crossAxisCount: 2,
                          crossAxisSpacing: 0.0,
                          mainAxisSpacing: 1.0,
                        ),
                        itemCount:
                            _questionCategryList[index].questionsList.length,
                        itemBuilder: (context, indexList) => QuestionTile(
                            question: _questionCategryList[index]
                                .questionsList[indexList])),
                  )),
            )
          : const Center(
              child: CircularProgressIndicator(),
            ),
    );
  }
}
