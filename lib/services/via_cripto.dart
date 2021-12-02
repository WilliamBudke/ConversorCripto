import 'package:conversorcripto/models/result_cripto.dart';
import 'package:http/http.dart' as http;

class ViaCriptoService {
  static Future<ResultCripto> fetchCripto({String? cripto})
  async {
    final Uri uri = Uri.parse('https://www.mercadobitcoin.net/api/$cripto/ticker/');
    final response = await http.get(uri);
    if (response.statusCode == 200){
      return ResultCripto.fromJson(response.body);
    }else{
      throw Exception('Requisição inválida!');
    }
  }
}