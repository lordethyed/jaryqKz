import 'package:json_annotation/json_annotation.dart';

part 'time_model.g.dart';

@JsonSerializable()
class PrayerTimesModel {
  final String city;
  final List<Map<String, dynamic>> result;

  PrayerTimesModel({required this.city, required this.result});

  factory PrayerTimesModel.fromJson(Map<String, dynamic> json) =>
      _$PrayerTimesModelFromJson(json);

  Map<String, dynamic> toJson() => _$PrayerTimesModelToJson(this);
}

@JsonSerializable()
class PrayerTime {
  final String asr;
  @JsonKey(name: "Date")
  final String date;
  final String maghrib;
  final String midnight;
  final String fajr;
  final String sunrise;
  final String sunset;
  final String isha;
  final String imsak;
  final String dhuhr;

  PrayerTime(
      {required this.asr,
      required this.date,
      required this.maghrib,
      required this.midnight,
      required this.fajr,
      required this.sunrise,
      required this.sunset,
      required this.isha,
      required this.imsak,
      required this.dhuhr});

  factory PrayerTime.fromJson(Map<String, dynamic> json) =>
      _$PrayerTimeFromJson(json);

  Map<String, dynamic> toJson() => _$PrayerTimeToJson(this);
}
