import 'package:jaryq_kz/src/data/datasources/assets_info.dart';
import 'package:jaryq_kz/src/data/datasources/local/questions_local_datasource.dart';
import 'package:jaryq_kz/src/data/models/question_model.dart';

abstract class QuestionsReposity {
  Future<List<Question>> getQuestions();
}

class QuestionsReposityImpl implements QuestionsReposity {
  final AssetsInfo assetsInfo;
  final QuestionsLocalDataSource questionsLocalDataSource;

  QuestionsReposityImpl(
      {required this.assetsInfo, required this.questionsLocalDataSource});

  @override
  Future<List<Question>> getQuestions() async {
    if (await assetsInfo.isLocalAsset("assets/data/books.json")) {
      try {
        final questionsList = await questionsLocalDataSource.getQuestions();
        return questionsList;
      } catch (e) {
        rethrow;
      }
    } else {
      throw "Assets not found";
    }
  }
}
