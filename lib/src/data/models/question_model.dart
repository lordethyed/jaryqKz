import 'package:json_annotation/json_annotation.dart';

part 'question_model.g.dart';

@JsonSerializable()
class Question {
  final String title;
  final String imagePath;
  final String content;
  @JsonKey(name: "site_link")
  final String siteLink;
  final String category;

  Question(
      {required this.title,
      required this.imagePath,
      required this.content,
      required this.siteLink,
      required this.category});

  factory Question.fromJson(Map<String, dynamic> json) =>
      _$QuestionFromJson(json);

  Map<String, dynamic> toJson() => _$QuestionToJson(this);
}

class QuestionCategory {
  final String categoryName;
  final List<Question> questionsList;

  QuestionCategory({required this.categoryName, required this.questionsList});
}
