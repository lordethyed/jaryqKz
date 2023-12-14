abstract class AppAssets {
  static const images = _Images();
  static const svg = _Svg();
  static const json = _Json();
}

class _Images{
  const _Images();  
}

class _Svg{
  const _Svg();
  final String fajr = "assets/icons/fajr.svg";
  final String salah = "assets/icons/namaz.svg";
  final String salahActive = "assets/icons/namaz_active.svg";
  final String book = "assets/icons/kitap.svg";
  final String bookActive = "assets/icons/kitap_active.svg";
  final String time = "assets/icons/time.svg";
  final String timeActive = "assets/icons/time_active.svg";
  final String question = "assets/icons/question.svg";
  final String questionActive = "assets/icons/question_active.svg";
  final String info = "assets/icons/info.svg";
  final String infoActive = "assets/icons/info_active.svg";
}

class _Json{
  const _Json();
}