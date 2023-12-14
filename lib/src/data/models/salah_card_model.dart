import 'package:json_annotation/json_annotation.dart';

part 'salah_card_model.g.dart';

@JsonSerializable()
class SalahCard {
  final String title;
  final String desc;
  final String content;
  final String videoLink;
  final String previewImage;

  SalahCard(this.previewImage, {required this.title, required this.desc, required this.content, required this.videoLink});

  factory SalahCard.fromJson(Map<String, dynamic> json) => _$SalahCardFromJson(json);

  Map<String, dynamic> toJson() => _$SalahCardToJson(this);
}