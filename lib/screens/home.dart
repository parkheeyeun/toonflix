import 'package:flutter/material.dart';
import 'package:toonflix/models/webtoon_model.dart';
import 'package:toonflix/services/api_service.dart';
import 'package:toonflix/widgets/webtoon_widget.dart';

class Home extends StatelessWidget {
  Home({super.key});

  final Future<List<WebtoonModel>> webtoons = ApiService.getTodaysToon();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          "오늘의 웹툰",
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),
        elevation: 2,
        centerTitle: true,
        backgroundColor: Colors.white,
        foregroundColor: Colors.green,
      ),
      // await의 역할...? 데이터 받아오는 것을 기다린다
      // future, builder가 필요
      body: FutureBuilder(
        future: webtoons,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Column(
              children: [
                const SizedBox(
                  height: 30,
                ),
                Expanded(
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    padding: const EdgeInsets.symmetric(
                      vertical: 10,
                      horizontal: 20,
                    ),
                    itemCount: snapshot.data!.length,
                    // 스크롤을 할때 아이템이 build된다
                    itemBuilder: (context, index) {
                      // print(index);
                      var webtoon = snapshot.data![index];
                      return Webtoon(
                          title: webtoon.title,
                          thumb: webtoon.thumb,
                          id: webtoon.id);
                    },
                    separatorBuilder: (context, index) =>
                        const SizedBox(width: 40),
                  ),
                ),
              ],
            );
            // 항목이 많을 경우 listview를 사용하면 좋음
            // return ListView(
            //   children: [
            //     // snapshot.data는 데이터를 반드시 가지고 있다(!)
            //     for (var webtoon in snapshot.data!) Text(webtoon.title)
            //   ],
            // );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
