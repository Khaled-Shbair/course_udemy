//import 'dart:convert';
//import 'package:http/http.dart' as http;
//
//import '../models/characters.dart';
//import 'api paths.dart';
import 'package:dio/dio.dart';

class CharactersWebServices {
  late Dio dio;

  CharactersWebServices() {
    BaseOptions options = BaseOptions(
      baseUrl: 'https://www.breakingbadapi.com/api/',
      receiveDataWhenStatusError: true,
      connectTimeout: 20 * 1000, // 60 seconds,
      receiveTimeout: 20 * 1000,
    );

    dio = Dio(options);
  }

  Future<List<dynamic>> getAllCharacters() async {
    try {
      Response response = await dio.get('characters');
      print(response.data.toString());
      return response.data;
    } catch (e) {
      print(e.toString());
      return [];
    }
  }

//Future<List<dynamic>> getCharacterQuotes(String charName) async {
//  try {
//    Response response = await dio.get('quote' , queryParameters: {'author' : charName});
//    print(response.data.toString());
//    return response.data;
//  } catch (e) {
//    print(e.toString());
//    return [];
//  }
//}

//Future<List<Characters>> getAllCharacters() async {
//  var httpUri = Uri.parse(ApiPath.characters);
//  Response response = await http.get(httpUri);
//  if (response.statusCode == 200) {
//    var jsonResponse = jsonDecode(response.body);
//    List<Characters> characters = [];
//    characters.clear();
//    for (var item in jsonResponse) {
//      characters.add(Characters.fromJson(item));
//    }
//    print('List characters ::: $characters');
//    print('فاصل..........');
//    print('jsonResponse ::: $jsonResponse');
//    return characters;
//  }
//  return [];
//}
}
