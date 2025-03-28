import '../api/quran_api.dart';
import '../db/crowdilm_database.dart';
import '../models/aya.dart';
import '../models/line.dart';
import '../models/quran.dart';
import '../models/sura.dart';
import '../models/quran_line.dart';

class CrowdilmController {
  final CrowdilmDatabase database;
  final QuranApi quranApi;

  const CrowdilmController(this.database, this.quranApi);

  Future<List<Line>> getLines() async {
    var list = database.getLines();
    // if there is no items in the database, then get it from the api
    if (list.isEmpty) {
      list = await quranApi.getLines();
      database.addLines(list);
    }
    return list;
  }

  Future<List<Quran>> getQurans() async {
    var list = database.getQurans();
    // if there is no items in the database, then get it from the api
    if (list.isEmpty) {
      list = await quranApi.getQurans();
      database.addQurans(list);
    }
    return list;
  }

  Future<List<QuranLine>> getQuranLines(String quranId) async {
    var list = database.getQuranLines(quranId);
    // if there is no items in the database, then get it from the api
    if (list.isEmpty) {
      list = await quranApi.getQuranLines(quranId);
      database.addQuranLines(list);
    }
    return list;
  }

  List<Aya> getAya(String paging, int pageId) {
    return database.getAya(paging, pageId);
  }

  Future<List<Sura>> getSuras() async {
    List<Sura> list = database.getSuras();
    // if there is no items in the database, then get it from the api
    if (list.isEmpty) {
      list = await quranApi.getSuras();
      database.addSuras(list);
    }
    return list;
  }

  Sura getSura(int suraId) {
    return database.getSura(suraId);
  }

  Map<String, String> getSettings() {
    return database.getSettings();
  }

  void saveSettings(Map<String, String> settings) {
    database.saveSettings(settings);
  }
}
