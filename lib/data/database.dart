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
