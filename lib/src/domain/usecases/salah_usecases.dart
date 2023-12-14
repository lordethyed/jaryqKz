import 'package:jaryq_kz/src/data/models/salah_card_model.dart';
import 'package:jaryq_kz/src/domain/repositories/salah_reposity.dart';

abstract class SalahUseCase {
  Future<List<SalahCard>?> getSalahCards(bool isMan);
}

class SalahUseCaseImpl implements SalahUseCase {
  final SalahRepositry salahRepositry;

  SalahUseCaseImpl({required this.salahRepositry});

  @override
  Future<List<SalahCard>?> getSalahCards(bool isMan) async {
    try {
      final List<SalahCard> salahCardsList =
          await salahRepositry.getSalahCards(isMan);
      return salahCardsList;
    } catch (_){
      rethrow;
    }
  }
}