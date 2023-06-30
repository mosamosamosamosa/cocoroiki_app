import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:cocoroiki_app/api/clients.dart';

class Posts {
  var headers = {'Content-Type': 'application/json'};

  //家族ごとの投稿を一覧取得
  getPosts() async {
    var request = http.Request('GET', Uri.parse('${Clients().url}posts'));
    Map<String, dynamic> familyPost;

    http.StreamedResponse stream_response = await request.send();
    var response = await http.Response.fromStream(stream_response);

    if (response.statusCode == 200 || response.statusCode == 201) {
      var posts = jsonDecode(response.body).cast<Map<String, dynamic>>();
      print("postsの中：$posts");

      return posts;
    } else {
      print(response.reasonPhrase);
      print(response.statusCode);
      return "投稿取得失敗";
    }
  }
}
