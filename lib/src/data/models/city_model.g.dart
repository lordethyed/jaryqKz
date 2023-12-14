// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'city_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CitiesModel _$CitiesModelFromJson(Map<String, dynamic> json) => CitiesModel(
      count: json['count'] as int,
      next: json['next'] as String?,
      previous: json['previous'] as String?,
      results: (json['results'] as List<dynamic>)
          .map((e) => e as Map<String, dynamic>)
          .toList(),
    );

Map<String, dynamic> _$CitiesModelToJson(CitiesModel instance) =>
    <String, dynamic>{
      'count': instance.count,
      'next': instance.next,
      'previous': instance.previous,
      'results': instance.results,
    };

City _$CityFromJson(Map<String, dynamic> json) => City(
      title: json['title'] as String,
      lng: json['lng'] as String,
      lat: json['lat'] as String,
      timezone: json['timezone'] as String,
      slug: json['slug'] as String,
    );

Map<String, dynamic> _$CityToJson(City instance) => <String, dynamic>{
      'title': instance.title,
      'lng': instance.lng,
      'lat': instance.lat,
      'timezone': instance.timezone,
      'slug': instance.slug,
    };
