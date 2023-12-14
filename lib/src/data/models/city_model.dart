import 'package:json_annotation/json_annotation.dart';

part 'city_model.g.dart';

@JsonSerializable()
class CitiesModel {
  final int count;
  final String? next;
  final String? previous;
  final List<Map<String, dynamic>> results;

  CitiesModel(
      {required this.count,
      required this.next,
      required this.previous,
      required this.results});

  factory CitiesModel.fromJson(Map<String, dynamic> json) =>
      _$CitiesModelFromJson(json);

  Map<String, dynamic> toJson() => _$CitiesModelToJson(this);
}

@JsonSerializable()
class City {
  final String title;
  final String lng;
  final String lat;
  final String timezone;
  final String slug;

  City(
      {required this.title,
      required this.lng,
      required this.lat,
      required this.timezone,
      required this.slug});

  factory City.fromJson(Map<String, dynamic> json) => _$CityFromJson(json);

  Map<String, dynamic> toJson() => _$CityToJson(this);
}
