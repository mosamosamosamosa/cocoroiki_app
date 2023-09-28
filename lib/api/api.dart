import 'package:http/http.dart' as http;
import 'dart:convert';

class API {
  static const String BASE_URL = "https://cocoroiki-bff.yumekiti.net";
  static const headers = <String, String>{ 'Content-Type': 'application/json;charset=UTF-8' };

  //   get func
  get(String url) async {
    var response = await http.get(Uri.parse(BASE_URL + url));
    return response;
  }

  //   post func
  post(String url, dynamic data) async {
    var response = await http.post(Uri.parse(BASE_URL + url), headers: headers, body: jsonEncode(data));
    return response;
  }

  //   put func
  put(String url, dynamic data) async {
    var response = await http.put(Uri.parse(BASE_URL + url), headers: headers, body: jsonEncode(data));
    return response;
  }

  //   delete func
  delete(String url) async {
    var response = await http.delete(Uri.parse(BASE_URL + url));
    return response;
  }
}


// API().get("/api/posts").then((response) {
//   print(response.body);
// });
//
// API().post("/api/posts", {"data": {
//   "user": 1,
//   "content": "asdasdasd",
//   "images": ["1", "2"]
// }}).then((response) {
//   print(response.body);
// });