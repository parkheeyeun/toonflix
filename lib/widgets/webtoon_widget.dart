import 'package:flutter/material.dart';
import 'package:toonflix/screens/detail_screen.dart';

class Webtoon extends StatelessWidget {
  final String title, thumb, id;

  const Webtoon({
    super.key,
    required this.title,
    required this.thumb,
    required this.id,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // DetailScreen을 렌더했지만 다른 페이지로 이동하게끔 하는 효과를 낼수 있다
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetailScreen(
              title: title,
              thumb: thumb,
              id: id,
            ),
            // 이미지가 바닥에서부터 올라온다
            // fullscreenDialog: true,
          ),
        );
      },
      child: Column(
        children: [
          // 겹치는?화면에 같은 태그를 주면 이미지가 이동하는 것처럼 보여지게 된다
          Hero(
            tag: id,
            child: Container(
              width: 250,
              clipBehavior: Clip.hardEdge,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                boxShadow: [
                  BoxShadow(
                    blurRadius: 5,
                    offset: const Offset(0, 0),
                    color: Colors.black.withOpacity(0.5),
                  ),
                ],
              ),
              child: Image.network(
                thumb,
              ),
            ),
          ),
          const SizedBox(height: 15),
          Text(
            title,
            style: const TextStyle(fontSize: 18),
          ),
        ],
      ),
    );
  }
}
