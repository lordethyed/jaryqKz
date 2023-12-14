import 'package:intl/intl.dart';
import 'package:jaryq_kz/src/data/models/city_model.dart';
import 'package:jaryq_kz/src/data/models/time_model.dart';
import 'package:jaryq_kz/src/domain/repositories/time_reposity.dart';

abstract class TimeUseCase {
  Future<List<City>> getCities();
  Future<PrayerTime> getTime(int year, double lat, double lng);
}

class TimeUseCaseImpl implements TimeUseCase {
  final TimeReposity timeReposity;

  TimeUseCaseImpl({required this.timeReposity});
  @override
  Future<List<City>> getCities() async {
    try {
      int page = 1;
      List<City> citiesList = [];
      CitiesModel citiesSheet = await timeReposity.getCities(page);
      for (var el in citiesSheet.results) {
        citiesList.add(City.fromJson(el));
      }
      while (citiesSheet.next != null) {
        page++;
        citiesSheet = await timeReposity.getCities(page);
        for (var el in citiesSheet.results) {
          citiesList.add(City.fromJson(el));
        }
      }
      return citiesList;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<PrayerTime> getTime(int year, double lat, double lng) async {
    try {
      final timeSheet = await timeReposity.getTime(year, lat, lng);
      final results = timeSheet.result;
      for (Map<String, dynamic> el in results) {
        final element = PrayerTime.fromJson(el);
        if(element.date == DateFormat("yyyy-MM-dd").format(DateTime.now())){
          return element;
        }
      }
      return PrayerTime.fromJson(results.first);
    } catch (e) {
      rethrow;
    }
  }
}
