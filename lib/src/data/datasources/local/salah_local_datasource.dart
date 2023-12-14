import 'package:jaryq_kz/src/data/datasources/json_client.dart';
import 'package:jaryq_kz/src/data/models/salah_card_model.dart';

abstract class SalahLocalDataSource {
  Future<List<SalahCard>> getSalahCards(bool isMan);
}

class SalahLocalDataSourceImpl implements SalahLocalDataSource {
  final MyJsonClient myJsonClient;

  SalahLocalDataSourceImpl({required this.myJsonClient});

  @override
  Future<List<SalahCard>> getSalahCards(bool isMan) async {
    try {
      final response = await myJsonClient.getJsonList(
        isMan ? "assets/data/namaz_man.json" : "assets/data/namaz_woman.json",
      );
      List<SalahCard> salahCardList = [];
      for (Map<String, dynamic> element in response) {
        salahCardList.add(SalahCard.fromJson(element));
      }
      return salahCardList;
    } catch (e) {
      rethrow;
    }
  }
}
