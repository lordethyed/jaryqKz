import 'dart:convert';

import 'package:jaryq_kz/src/data/datasources/http_client.dart';
import 'package:jaryq_kz/src/data/models/city_model.dart';
import 'package:jaryq_kz/src/data/models/time_model.dart';

abstract class TimeRemoteDataSource {
  Future<CitiesModel> getCities(int page);
  Future<PrayerTimesModel> getTime(int year, double lat, double lng);
}

class TimeRemoteDataSourceImpl implements TimeRemoteDataSource {
  final MyHttpClient myHttpClient;

  TimeRemoteDataSourceImpl({required this.myHttpClient});
  @override
  Future<CitiesModel> getCities(int page) async {
    try {
      final response =
          await myHttpClient.get("https://api.muftyat.kz/cities/?page=$page");
      final jsonBody = json.decode(response.body) as Map<String, dynamic>;
      final citiesModel =
          CitiesModel.fromJson(jsonBody);
      return citiesModel;
    } catch (e) {
      rethrow;
    }
  }
  
  @override
  Future<PrayerTimesModel> getTime(int year, double lat, double lng) async {
        try {
      final response =
          await myHttpClient.get("https://api.muftyat.kz/prayer-times/$year/$lat/$lng");
      final jsonBody = json.decode(response.body) as Map<String, dynamic>;
      final citySheet =
          PrayerTimesModel.fromJson(jsonBody);
      return citySheet;
    } catch (e) {
      rethrow;
    }
  }
}
