class Kids {
  final String name;

  Kids({
    required this.name,
  });
}

List<Kids> kids_list = [
  Kids(name: "まもる"),
  Kids(name: "かおり"),
  Kids(name: "ゆうた")
];

class Posts {
  final int id;
  final String username;
  final String content;
  final List<String> image_url;
  final int like_count;
  final DateTime created_at;

  Posts(
      {required this.id,
      required this.username,
      required this.content,
      required this.image_url,
      required this.like_count,
      required this.created_at});
}

List<Posts> posts_list = [
  Posts(
      id: 1,
      username: "朋子",
      content: "今日はおばあちゃんと会えて楽しかった！",
      image_url: [
        'https://thumb.photo-ac.com/cd/cd1c7ccec442b51fb3de581e0c0e5cb0_t.jpeg',
        'https://thumb.photo-ac.com/f5/f5a02f4977865dac8db664c6a2c816c4_w.jpeg',
        'https://thumb.photo-ac.com/11/11f9fa9424c0ec309bbb18139bfd1a82_w.jpeg',
        'https://thumb.photo-ac.com/0f/0fe47e6740d3e2339ce2abb0e8dead64_w.jpeg',
      ],
      like_count: 3,
      created_at: DateTime.now())
];

class Users {
  final int id;
  final String name;
  final String image;

  Users({required this.id, required this.name, required this.image});
}

List<Users> users_list = [
  Users(
      id: 1,
      name: '朋子',
      image:
          'https://thumb.photo-ac.com/11/11f9fa9424c0ec309bbb18139bfd1a82_w.jpeg'),
  Users(
      id: 2,
      name: 'よしえ',
      image:
          'https://thumb.photo-ac.com/0f/0fe47e6740d3e2339ce2abb0e8dead64_w.jpeg')
];

class QuestManage {
  final String date;
  final String title;
  final String icon;
  final String gohoubi;

  QuestManage(
      {required this.date,
      required this.title,
      required this.icon,
      required this.gohoubi});
}

List<QuestManage> quest_manage = [
  QuestManage(
      date: '2023年8月28日',
      title: 'ごはんをつくろう',
      icon: 'gohoubi_kodukai_icon.svg',
      gohoubi: '10円ゲット!'),
  QuestManage(
      date: '2023年8月34日',
      title: 'おさんぽしよう',
      icon: 'gohoubi_omocha_icon.svg',
      gohoubi: 'ミニカーゲット!'),
  QuestManage(
      date: '2023年5月23日',
      title: 'おりょうりしよう',
      icon: 'gohoubi_kodukai_icon.svg',
      gohoubi: '10円ゲット!'),
];

class Reward1 {
  final String title;
  final String icon;

  Reward1({
    required this.title,
    required this.icon,
  });
}

List<Reward1> reward1_list = [
  Reward1(
    title: '10円',
    icon: 'gohoubi_kodukai_icon.svg',
  ),
  Reward1(
    title: 'あめ',
    icon: 'gohoubi_okashi_icon.svg',
  ),
];

class Reward2 {
  final String title;
  final String icon;

  Reward2({
    required this.title,
    required this.icon,
  });
}

List<Reward2> reward2_list = [
  Reward2(
    title: '50円',
    icon: 'gohoubi_kodukai_icon.svg',
  ),
  Reward2(
    title: 'クッキー',
    icon: 'gohoubi_sweet_icon.svg',
  ),
  Reward2(
    title: 'アイス',
    icon: 'gohoubi_okashi_icon.svg',
  ),
];

class Reward3 {
  final String title;
  final String icon;

  Reward3({
    required this.title,
    required this.icon,
  });
}

List<Reward3> reward3_list = [
  Reward3(
    title: '100円',
    icon: 'gohoubi_kodukai_icon.svg',
  ),
  Reward3(
    title: 'ケーキ',
    icon: 'gohoubi_sweet_icon.svg',
  ),
  Reward3(
    title: 'ミニカー',
    icon: 'gohoubi_omocha_icon.svg',
  ),
];
