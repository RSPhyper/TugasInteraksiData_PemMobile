import 'dart:convert';
import 'package:http/http.dart' as http;
import 'Json/Json.dart';

Future<List<Test>> getTests() async {
  final response = await http.get(
    Uri.parse('https://jsonplaceholder.typicode.com/todos'),
  );

  if (response.statusCode == 200) {
    final List<dynamic> data = json.decode(response.body);
    final List<Test> tests = data.map((json) => Test.fromJson(json)).toList();
    return tests;
  } else {
    throw Exception('Gagal mengambil data pengujian');
  }
}
