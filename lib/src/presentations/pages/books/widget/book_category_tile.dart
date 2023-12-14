import 'package:flutter/material.dart';
import 'package:jaryq_kz/src/data/models/book_models.dart';
import 'package:jaryq_kz/src/presentations/pages/books/widget/book_tile.dart';

class BookCategoryTile extends StatelessWidget {
  const BookCategoryTile({
    super.key, required this.bookCategory,
  });
  
  final BookCategory bookCategory;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(bookCategory.categoryName),
        const SizedBox(
          height: 10,
        ),
        SizedBox(
          height: 300,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: bookCategory.booksList.length,
            itemBuilder: (context, index) => BookTile(book: bookCategory.booksList[index],),
          ),
        ),
      ],
    );
  }
}