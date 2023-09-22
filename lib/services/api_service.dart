import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:toonflix/models/webtoon_detail.dart';
import 'package:toonflix/models/webtoon_episode.dart';
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

  static Future<WebtoonDetail> getById(String id) async {
    final url = Uri.parse('$baseUrl/$id');
    final response = await http.get(url);
    if (response.statusCode == 200) {
      final webtoon = jsonDecode(response.body);
      return WebtoonDetail.fromJson(webtoon);
    }
    throw Error();
  }

  static Future<List<WebtoonEpisode>> getLastEpi(String id) async {
    List<WebtoonEpisode> episodelist = [];
    final url = Uri.parse('$baseUrl/$id/episodes');
    final response = await http.get(url);
    if (response.statusCode == 200) {
      final episodes = jsonDecode(response.body);
      for (var episode in episodes) {
        episodelist.add(WebtoonEpisode.fromJson(episode));
      }
      return episodelist;
    }
    throw Error();
  }
}
