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
        'https://thumb.photo-ac.com/cd/cd1c7ccec442b51fb3de581e0c0e5cb0_t.jpeg',
        'https://thumb.photo-ac.com/cd/cd1c7ccec442b51fb3de581e0c0e5cb0_t.jpeg',
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
          'https://thumb.photo-ac.com/cd/cd1c7ccec442b51fb3de581e0c0e5cb0_t.jpeg')
];
