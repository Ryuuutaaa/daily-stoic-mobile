import 'package:stoicism/models/reflection.dart';
import 'package:stoicism/services/json_service.dart';

class ReflectionController {
  Future<List<Reflection>> getReflection() async {
    final data = await JsonService.loadData('assets/datas/reflections.json');
    return data.map((json) => Reflection.fromJson(json)).toList();
  }
}
