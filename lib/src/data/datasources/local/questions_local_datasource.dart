import 'package:jaryq_kz/src/data/datasources/json_client.dart';
import 'package:jaryq_kz/src/data/models/question_model.dart';

abstract class QuestionsLocalDataSource{
  Future<List<Question>> getQuestions();
}

class QuestionsLocalDataSourceImpl implements QuestionsLocalDataSource {
  final MyJsonClient myJsonClient;

  QuestionsLocalDataSourceImpl({required this.myJsonClient});
  
  @override
  Future<List<Question>> getQuestions() async {
    try{
      final response = await myJsonClient.getJsonList("assets/data/surak_jauap.json");
      List<Question> questionList = [];
      for(Map<String, dynamic> element in response){
        questionList.add(Question.fromJson(element));
      }
      return questionList;
    } catch (e) {
      rethrow;
    }
  }
  
}