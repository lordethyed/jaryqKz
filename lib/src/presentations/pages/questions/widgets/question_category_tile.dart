import 'package:flutter/material.dart';
import 'package:jaryq_kz/src/data/models/question_model.dart';
import 'package:jaryq_kz/src/presentations/pages/questions/widgets/question_tile.dart';

class QuestionCategoryTile extends StatelessWidget {
  const QuestionCategoryTile({super.key, required this.questionCategory});
  final QuestionCategory questionCategory;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(questionCategory.categoryName),
        const SizedBox(
          height: 10,
        ),
        SizedBox(
          height: 170,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: questionCategory.questionsList.length,
            itemBuilder: (context, index) => QuestionTile(question: questionCategory.questionsList[index],),
          ),
        ),
      ],
    );
  }
}