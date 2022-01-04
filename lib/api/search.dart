import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:library_app/model/books_data.model.dart';

Future searchData({required String bookName, required int page}) async {
  final client = http.Client();
  final headers = {
    'Content-type': 'application/json',
    'Accept': 'application/json',
    "Access-Control-Allow-Origin": "*",
  };
  String baseUrl = "https://api.itbook.store/1.0/search/$bookName/$page";
  final Uri uri = Uri.parse(baseUrl);
  final http.Response response = await client.get(
    uri,
    headers: headers,
  );
  final statusCode = response.statusCode;
  final body = response.body;

  if (statusCode == 200) {
    var modelledData = BooksData.fromJson(jsonDecode(body));
    // print(modelledData.total);
    return modelledData;
  } else {
    return false;
  }
}
