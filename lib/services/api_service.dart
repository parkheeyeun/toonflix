import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:toonflix/models/webtoon_model.dart';

class ApiService {

  static const String baseUrl =
      "https://webtoon-crawler.nomadcoders.workers.dev";
  static const String today = "today";

  static Future<List<WebtoonModel>> getTodaysToon() async {
  List<WebtoonModel> webtoonlist = [];
    final url = Uri.parse('$baseUrl/$today');
    // 비동기 함수
    final response = await http.get(url);
    if (response.statusCode == 200) {
      final List<dynamic> webtoons = jsonDecode(response.body);
      for (var webtoon in webtoons) {
        // final toon = WebtoonModel.fromJson(webtoon);
        // print(toon);
        webtoonlist.add(WebtoonModel.fromJson(webtoon));
      }
      return webtoonlist;
    }
    throw Error();
  }
}
