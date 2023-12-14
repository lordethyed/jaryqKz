import 'package:jaryq_kz/src/data/datasources/json_client.dart';
import 'package:jaryq_kz/src/data/models/book_models.dart';

abstract class BooksLocalDataSource{
  Future<List<Book>> getBooks();
}

class BooksLocalDataSourceImpl implements BooksLocalDataSource {
  final MyJsonClient myJsonClient;

  BooksLocalDataSourceImpl({required this.myJsonClient});
  
  @override
  Future<List<Book>> getBooks() async {
    try{
      final response = await myJsonClient.getJsonList("assets/data/books.json");
      List<Book> booksList = [];
      for(Map<String, dynamic> element in response){
        booksList.add(Book.fromJson(element));
      }
      return booksList;
    } catch (e) {
      rethrow;
    }
  }
  
}