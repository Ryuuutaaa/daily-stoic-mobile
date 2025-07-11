import 'package:stoicism/models/qoute.dart';
import 'package:stoicism/services/json_service.dart';

class QuoteController {
  Future<List<Quote>> getQuotes() async {
    final data = await JsonService.loadData('assets/datas/quotes.json');
    return data.map((json) => Quote.fromJson(json)).toList();
  }
}
