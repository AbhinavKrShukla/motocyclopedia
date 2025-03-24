import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:motocyclopedia_2/constants.dart';

Future<List> getDetails ({make, model, year}) async {
  var param = '';
  if (make != null) param += 'make=$make&';
  if (model != null) param += 'model=$model&';
  if (year != null) param += 'year=$year&';
  final url = urlBase + param;

  http.Response response = await http.get(
    Uri.parse(url),
    headers: {apiKeyLabel: apiKeyValue},
  );

  if (response.statusCode == HttpStatus.ok) {
    final jsonResponse =jsonDecode(response.body);
    return jsonResponse;  // jsonResponse will be a list by default
  } else {
    return [-1];
  }

}