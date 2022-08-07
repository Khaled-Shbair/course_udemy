import 'dart:convert';
import 'package:http/http.dart' as http;

import '../models/characters.dart';
import 'api paths.dart';

class TestYoutube {
  Future<List<Characters>> getAllCharacters() async {
    var httpUri = Uri.parse(ApiPath.characters);
    var response = await http.get(httpUri);
    if (response.statusCode == 200) {
      var jsonResponse = jsonDecode(response.body);
      Characters character = Characters.fromJson(jsonResponse);
    }
    return [];
  }
}
