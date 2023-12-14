import 'package:jaryq_kz/src/data/datasources/assets_info.dart';
import 'package:jaryq_kz/src/data/datasources/local/books_local_datasource.dart';
import 'package:jaryq_kz/src/data/models/book_models.dart';

abstract class BooksReposity {
  Future<List<Book>> getBooks();
}

class BooksReposityImpl implements BooksReposity {
  final AssetsInfo assetsInfo;
  final BooksLocalDataSource booksLocalDataSource;

  BooksReposityImpl(
      {required this.assetsInfo, required this.booksLocalDataSource});

  @override
  Future<List<Book>> getBooks() async {
    if (await assetsInfo.isLocalAsset("assets/data/books.json")) {
      try {
        final booksList = await booksLocalDataSource.getBooks();
        return booksList;
      } catch (e) {
        rethrow;
      }
    } else {
      throw "Assets not found";
    }
  }
}
