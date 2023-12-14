import 'package:flutter/material.dart';
import 'package:jaryq_kz/src/data/models/book_models.dart';

class FilterTile extends StatelessWidget {
  const FilterTile({super.key, required this.bookCategory});
  final BookCategory bookCategory;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(bookCategory.categoryName),
        const Icon(Icons.arrow_forward_ios),
      ],
    );
  }
}