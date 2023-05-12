import 'package:get/get.dart';
import 'package:dio/dio.dart';
import 'package:hemo_plus_mobile/Doador/model/doadorModel.dart';
import 'package:hemo_plus_mobile/api/api.dart';

class DoadorService{

  final Dio dio = Dio();

  Future<void> post(DoadorModel doador) async {
    try {
      await dio.post('${API.baseUrl}/doador', data: doador.toJson());
    } on DioError catch (e) {
      print('Erro ${e.response?.statusCode}: ${e.response?.statusMessage}');
    }
  }
}