import 'package:flutter/material.dart';
import 'package:jaryq_kz/src/data/models/book_models.dart';
import 'package:jaryq_kz/src/presentations/pages/books/widget/filter_tile.dart';

class CustomModalBottomSheet extends StatelessWidget {
  const CustomModalBottomSheet({super.key, required this.bookCategoryList, required this.onPressed});
  final List<BookCategory> bookCategoryList;
  final Function(int) onPressed;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(24)),
          color: Colors.grey.shade50),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("Категориялар"),
            const SizedBox(
              height: 10,
            ),
            SizedBox(
              height: 300,
              child: ListView.separated(
                itemCount: bookCategoryList.length,
                separatorBuilder: (context, index) => const Divider(),
                itemBuilder: (context, index) => InkWell(
                  onTap: (){
                    onPressed.call(index);
                  },
                  child: FilterTile(bookCategory: bookCategoryList[index]),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
