// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'question_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Question _$QuestionFromJson(Map<String, dynamic> json) => Question(
      title: json['title'] as String,
      imagePath: json['imagePath'] as String,
      content: json['content'] as String,
      siteLink: json['site_link'] as String,
      category: json['category'] as String,
    );

Map<String, dynamic> _$QuestionToJson(Question instance) => <String, dynamic>{
      'title': instance.title,
      'imagePath': instance.imagePath,
      'content': instance.content,
      'site_link': instance.siteLink,
      'category': instance.category,
    };
