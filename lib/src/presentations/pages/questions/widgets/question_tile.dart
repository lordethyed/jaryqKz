import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:jaryq_kz/src/data/models/question_model.dart';
import 'package:jaryq_kz/src/presentations/pages/questions/widgets/question_read_page.dart';

class QuestionTile extends StatelessWidget {
  const QuestionTile({super.key, required this.question});
  final Question question;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => QuestionReadPage(question: question))),
      child: Card(
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          child: SizedBox(
            width: 170,
            height: 100,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.all(Radius.circular(5)),
                  child: CachedNetworkImage(
                    imageUrl: question.imagePath,
                    height: 100,
                    width: 170,
                    fit: BoxFit.cover,
                  ),
                ),
                Expanded(
                  child: Text(
                    question.title,
                    style: const TextStyle(color: Colors.black),
                    maxLines: 3,
                    textAlign: TextAlign.center,
                    overflow: TextOverflow.ellipsis,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
