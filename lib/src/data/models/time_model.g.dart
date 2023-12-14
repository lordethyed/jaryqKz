// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'time_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PrayerTimesModel _$PrayerTimesModelFromJson(Map<String, dynamic> json) =>
    PrayerTimesModel(
      city: json['city'] as String,
      result: (json['result'] as List<dynamic>)
          .map((e) => e as Map<String, dynamic>)
          .toList(),
    );

Map<String, dynamic> _$PrayerTimesModelToJson(PrayerTimesModel instance) =>
    <String, dynamic>{
      'city': instance.city,
      'result': instance.result,
    };

PrayerTime _$PrayerTimeFromJson(Map<String, dynamic> json) => PrayerTime(
      asr: json['asr'] as String,
      date: json['Date'] as String,
      maghrib: json['maghrib'] as String,
      midnight: json['midnight'] as String,
      fajr: json['fajr'] as String,
      sunrise: json['sunrise'] as String,
      sunset: json['sunset'] as String,
      isha: json['isha'] as String,
      imsak: json['imsak'] as String,
      dhuhr: json['dhuhr'] as String,
    );

Map<String, dynamic> _$PrayerTimeToJson(PrayerTime instance) =>
    <String, dynamic>{
      'asr': instance.asr,
      'Date': instance.date,
      'maghrib': instance.maghrib,
      'midnight': instance.midnight,
      'fajr': instance.fajr,
      'sunrise': instance.sunrise,
      'sunset': instance.sunset,
      'isha': instance.isha,
      'imsak': instance.imsak,
      'dhuhr': instance.dhuhr,
    };
