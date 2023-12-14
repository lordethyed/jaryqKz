// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'book_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Book _$BookFromJson(Map<String, dynamic> json) => Book(
      imagePath: json['imagePath'] as String,
      bookName: json['bookName'] as String,
      bookAuthor: json['bookAuthor'] as String,
      bookDesc: json['bookDesc'] as String,
      bookLink: json['bookLink'] as String,
      category: json['category'] as String,
    );

Map<String, dynamic> _$BookToJson(Book instance) => <String, dynamic>{
      'imagePath': instance.imagePath,
      'bookName': instance.bookName,
      'bookAuthor': instance.bookAuthor,
      'bookDesc': instance.bookDesc,
      'bookLink': instance.bookLink,
      'category': instance.category,
    };
