import 'package:jaryq_kz/src/data/datasources/network_info.dart';
import 'package:jaryq_kz/src/data/datasources/remote/time_remote_datasource.dart';
import 'package:jaryq_kz/src/data/models/city_model.dart';
import 'package:jaryq_kz/src/data/models/time_model.dart';

abstract class TimeReposity {
  Future<CitiesModel> getCities(int page);
  Future<PrayerTimesModel> getTime(int year, double lat, double lng);
}

class TimeReposityImpl implements TimeReposity {
  final NetworkInfo networkInfo;
  final TimeRemoteDataSource timeRemoteDataSource;

  TimeReposityImpl({required this.networkInfo, required this.timeRemoteDataSource});
  @override
  Future<CitiesModel> getCities(int page) async {
    if(await networkInfo.isConnected){
      try {
         final citySheets = await timeRemoteDataSource.getCities(page);
         return citySheets;
      } catch (e) {
        rethrow;
      }
    } else {
      throw "No connection to internet";
    }
  }
  
  @override
  Future<PrayerTimesModel> getTime(int year, double lat, double lng) async {
    if(await networkInfo.isConnected){
      try {
         final citySheets = await timeRemoteDataSource.getTime(year, lat, lng);
         return citySheets;
      } catch (e) {
        rethrow;
      }
    } else {
      throw "No connection to internet";
    }
  }
}