import 'package:stoicism/models/filsuf.dart';
import 'package:stoicism/services/json_service.dart';

class FilsufController {
  Future<List<Filsuf>> getFilsuf() async {
    final data = await JsonService.loadData('assets/datas/filsuf.json');
    return data.map((json) => Filsuf.fromJson(json)).toList();
  }
}
