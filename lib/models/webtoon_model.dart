class WebtoonModel {
  final String title, thumb, id;

  // fromJson이라는 이름을 가지고 있는 named constructor
  WebtoonModel.fromJson(Map<String, dynamic> json)
      // 초기화
      : title = json['title'],
        thumb = json['thumb'],
        id = json['id'];
}
