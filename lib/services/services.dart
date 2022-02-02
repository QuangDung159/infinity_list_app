import 'dart:convert';
import 'dart:io';

import 'package:infinity_list_app/models/comment.dart';
import 'package:http/http.dart' as http;

Future<List<Comment>> getListCommentFromAPI(int start, int size) async {
  final url = Uri.parse(
      'https://jsonplaceholder.typicode.com/comments?_start=$start&_limit=$size');
      print(url);
  try {
    final res = await http.get(url);
    stdout.writeln(res);
    if (res.statusCode == 200) {
      final data = json.decode(res.body) as List;
      List<Comment> listComment = data
          .map((commentItem) {
            return Comment(
              body: commentItem['body'],
              postId: commentItem['postId'],
              id: commentItem['id'],
              email: commentItem['email'],
              name: commentItem['name']);
          }).toList();
      return listComment;
    }
    return [];
  } catch (ex) {
    print(ex);
    return [];
  }
}
