import 'dart:convert';

import 'package:conversorcripto/models/result_cripto.dart';
import 'package:http/http.dart' as http;

class ViaCriptoService {
  static Future<ResultCripto> fetchCripto({String? cripto})
  async {
    Map<String, dynamic> result;
    final Uri uri = Uri.parse('https://www.mercadobitcoin.net/api/$cripto/ticker/');
    final response = await http.get(uri);

    result = jsonDecode(response.body);

    if (response.statusCode == 200){
      return ResultCripto.fromJson(response.body);
    }else{
      throw Exception('Requisição inválida!');
    }
  }
}