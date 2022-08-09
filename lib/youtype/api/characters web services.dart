import 'dart:convert';
import 'api paths.dart';
import 'package:http/http.dart' as http;

class CharactersWebServices {
  Future<List<dynamic>> getAllCharacters() async {
    var httpUri = Uri.parse(ApiPath.characters);
    var response = await http.get(httpUri);
    if (response.statusCode == 200) {
      var jsonResponse = jsonDecode(response.body);
      return jsonResponse;
    }
    return [];
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

}
/*
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
    return response.data;
  } catch (e) {
    return [];
  }
}
*/
