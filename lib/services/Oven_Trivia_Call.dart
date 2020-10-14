import'package:quizono/module/Post.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

Future<List<Post>> fetchPost(String category) async {
  final response = await http.get(
      'https://opentdb.com/api.php?amount=10&category='+category+'&difficulty=easy&type=multiple');
  if (response.statusCode == 200) {
    List jsonResponse = json.decode(response.body)["results"];
    return jsonResponse.map((post) => new Post.fromMap(post)).toList();
  }
  else {
    throw Exception('Failed to load ');
  }
}
