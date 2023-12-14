import 'package:jaryq_kz/src/data/datasources/assets_info.dart';
import 'package:jaryq_kz/src/data/datasources/local/salah_local_datasource.dart';
import 'package:jaryq_kz/src/data/models/salah_card_model.dart';

abstract class SalahRepositry {
  Future<List<SalahCard>> getSalahCards(bool isMan);
}

class SalahRepositryImpl implements SalahRepositry {
  final SalahLocalDataSource salahLocalDataSource;
  final AssetsInfo assetsInfo;

  SalahRepositryImpl(
      {required this.salahLocalDataSource, required this.assetsInfo});

  @override
  Future<List<SalahCard>> getSalahCards(bool isMan) async {
    if (await assetsInfo.isLocalAsset("assets/data/namaz_man.json") &&
        await assetsInfo.isLocalAsset("assets/data/namaz_woman.json")) {
      try {
        final salahCardList = await salahLocalDataSource.getSalahCards(isMan);
        return salahCardList;
      } catch (e) {
        rethrow;
      }
    } else {
      throw "Assets not found";
    }
  }
}
