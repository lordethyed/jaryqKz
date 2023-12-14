import 'package:jaryq_kz/src/data/models/question_model.dart';
import 'package:jaryq_kz/src/domain/repositories/questions_reposity.dart';

abstract class QuestionsUseCase {
  Future<List<QuestionCategory>> getQuestionsCategory();
}

class QuestionsUseCaseImpl implements QuestionsUseCase {
  final QuestionsReposity questionsReposity;

  QuestionsUseCaseImpl({required this.questionsReposity});
  @override
  Future<List<QuestionCategory>> getQuestionsCategory() async {
    try {
      final booksList = await questionsReposity.getQuestions();
      List<QuestionCategory> booksCategoryList = [];

      for (Question book in booksList) {
        bool isBookAdded = false;
        for (QuestionCategory bookCategory in booksCategoryList) {
          if (book.category == bookCategory.categoryName) {
            bookCategory.questionsList.add(book);
            isBookAdded = true;
          }
        }
        if (!isBookAdded) {
          booksCategoryList.add(
            QuestionCategory(
              categoryName: book.category,
              questionsList: [book],
            ),
          );
        }
      }

      return booksCategoryList;
    } catch (_) {
      rethrow;
    }
  }
}
