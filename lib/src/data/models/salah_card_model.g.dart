// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'salah_card_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SalahCard _$SalahCardFromJson(Map<String, dynamic> json) => SalahCard(
      json['previewImage'] as String,
      title: json['title'] as String,
      desc: json['desc'] as String,
      content: json['content'] as String,
      videoLink: json['videoLink'] as String,
    );

Map<String, dynamic> _$SalahCardToJson(SalahCard instance) => <String, dynamic>{
      'title': instance.title,
      'desc': instance.desc,
      'content': instance.content,
      'videoLink': instance.videoLink,
      'previewImage': instance.previewImage,
    };
