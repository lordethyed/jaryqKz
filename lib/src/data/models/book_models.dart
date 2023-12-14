import 'package:json_annotation/json_annotation.dart';

part "book_models.g.dart";

@JsonSerializable()
class Book {
  final String imagePath;
  final String bookName;
  final String bookAuthor;
  final String bookDesc;
  final String bookLink;
  final String category;

  Book({required this.imagePath, required this.bookName, required this.bookAuthor, required this.bookDesc, required this.bookLink, required this.category});

  factory Book.fromJson(Map<String, dynamic> json) => _$BookFromJson(json);

  Map<String, dynamic> toJson() => _$BookToJson(this);
}

class BookCategory {
  final String categoryName;
  final List<Book> booksList;

  BookCategory({required this.categoryName, required this.booksList});
}