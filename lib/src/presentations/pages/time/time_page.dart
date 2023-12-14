import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:jaryq_kz/src/core/constants/colors.dart';
import 'package:jaryq_kz/src/data/models/city_model.dart';
import 'package:jaryq_kz/src/data/models/time_model.dart';
import 'package:jaryq_kz/src/domain/usecases/time_usecase.dart';
import 'package:jaryq_kz/src/presentations/pages/time/widget/time_tile.dart';

class TimePage extends StatefulWidget {
  const TimePage({super.key, required this.timeUseCase});
  final TimeUseCase timeUseCase;

  @override
  State<TimePage> createState() => _TimePageState();
}

class _TimePageState extends State<TimePage> {
  bool _isLoaded = false;
  late List<City> _citiesList;
  late String _selectedValue;
  late City _selectedCity;
  late PrayerTime _todayTime;

  void getCities() async {
    try {
      List<City> citieslist = await widget.timeUseCase.getCities();
      final todayTime = await widget.timeUseCase.getTime(
        int.parse(DateFormat("yyyy").format(DateTime.now())),
        double.parse(citieslist.first.lat),
        double.parse(citieslist.first.lng),
      );
      setState(() {
        _citiesList = citieslist;
        _selectedValue = citieslist.first.slug;
        _selectedCity = citieslist.first;
        _todayTime = todayTime;
        _isLoaded = true;
      });
    } catch (e) {
      rethrow;
    }
  }

  void cityChanged() async {
    try {
      for (City city in _citiesList) {
        if (city.slug == _selectedValue) {
          setState(() {
            _selectedCity = city;
          });
        }
      }
      final todayTime = await widget.timeUseCase.getTime(
        int.parse(DateFormat("yyyy").format(DateTime.now())),
        double.parse(_selectedCity.lat),
        double.parse(_selectedCity.lng),
      );
      setState(() {
        _todayTime = todayTime;
      });
    } catch (e) {
      rethrow;
    }
  }

  @override
  void initState() {
    getCities();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    String nowTime = DateFormat("hh:mm").format(DateTime.now());
    String nowDayOfWeek = DateFormat("EEEE").format(DateTime.now());
    return Scaffold(
      body: SafeArea(
        child: _isLoaded
            ? Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  DropdownButton<String>(
                    value: _selectedValue,
                    items: _citiesList
                        .map(
                          (item) => DropdownMenuItem<String>(
                            value: item.slug,
                            child: Text(
                              item.slug,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        )
                        .toList(),
                    onChanged: (String? newValue) {
                      setState(() {
                        _selectedValue = newValue!;
                      });
                      cityChanged();
                    },
                  ),
                  Text("$nowDayOfWeek, $nowTime"),
                  const Spacer(),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                        color: AppColor.kGreyWhiteColor,
                        border: Border.all(color: AppColor.kGreyColor),
                        borderRadius: const BorderRadius.all(Radius.circular(12),
                        ),
                      ),
                      child: SizedBox(
                        height: 350,
                        child: Column(
                          children: [
                            TimeTile(title: "Таң(Фаджр)",time: _todayTime.fajr),
                            TimeTile(title: "Күн(Восход)",time: _todayTime.sunrise),
                            TimeTile(title: "Бесін(Зухр)",time: _todayTime.dhuhr),
                            TimeTile(title: "Екінті(Аср)",time: _todayTime.asr),
                            TimeTile(title: "Шам(Магриб)",time: _todayTime.maghrib),
                            TimeTile(title: "Құптан(Иша)",time: _todayTime.isha),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const Spacer(),
                ],
              )
            : const Center(
                child: CircularProgressIndicator(),
              ),
      ),
    );
  }
}
