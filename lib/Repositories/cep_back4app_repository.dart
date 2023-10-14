import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:viacepdesafio/Models/cep_back4app_model.dart';
import 'package:viacepdesafio/Repositories/back4app_customdio.dart';

class CepBack4AppRepository {
  // final _customDio = Back4AppCustomDio();

  final _dio = Dio();

  CepBack4AppRepository() {
    _dio.options.headers["X-Parse-Application-Id"] = dotenv.get("BACK4APPAPPLICATIONID");
    _dio.options.headers["X-Parse-REST-API-Key"] = dotenv.get("BACK4APPRESTAPIKEY");
    _dio.options.headers["Content-Type"] = "application/json";
    _dio.options.baseUrl = dotenv.get("BACK4APPURL");
  }


    Future<CepBack4AppModel> obterCeps() async {
    var url = "/cep";

    var result = await _dio.get(url);
    return CepBack4AppModel.fromJson(result.data);
  }

      // Future<List<Ceps>> retornaInfo(String objectId) async {
        Future<Ceps> retornaInfo(String objectId) async {
    var url = "/cep/$objectId";
    print("Entrando no result");
    print(objectId);
    var result = await _dio.get(url);
    print("Saindo do result");
    return Ceps.fromJson(result.data);
    // return (result.data as List).map((e) => Ceps.fromJson(e)).toList();
  }

  Future<void> criar(Ceps cep) async {
    try{
 
       await _dio.post("/cep", data: cep.toJsonCreateEndPoint());
    }
    catch (e) {
      rethrow;
    }
  }

  Future<void> remover(String objectId) async {
    try{
      await _dio.delete("/cep/$objectId");
    }
    catch(e){
      rethrow;
    }
  }
}