import 'package:jaryq_kz/src/data/models/book_models.dart';
import 'package:jaryq_kz/src/domain/repositories/books_reposity.dart';

abstract class BooksUseCase {
  Future<List<BookCategory>> getBooksCategory();
  Future<List<Book>> getBooks();
}

class BooksUseCaseImpl implements BooksUseCase {
  final BooksReposity booksReposity;

  BooksUseCaseImpl({required this.booksReposity});
  @override
  Future<List<BookCategory>> getBooksCategory() async {
    try {
      final booksList = await booksReposity.getBooks();
      List<BookCategory> booksCategoryList = [];

      for (Book book in booksList) {
        bool isBookAdded = false;
        for (BookCategory bookCategory in booksCategoryList) {
          if (book.category == bookCategory.categoryName) {
            bookCategory.booksList.add(book);
            isBookAdded = true;
          }
        }
        if (!isBookAdded) {
          booksCategoryList.add(
            BookCategory(
              categoryName: book.category,
              booksList: [book],
            ),
          );
        }
      }

      return booksCategoryList;
    } catch (_) {
      rethrow;
    }
  }
  
  @override
  Future<List<Book>> getBooks() async {
    try {
      final booksList = await booksReposity.getBooks();
      return booksList;
    } catch (_) {
      rethrow;
    }
  }
}
