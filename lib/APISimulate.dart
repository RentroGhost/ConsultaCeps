import 'package:viacepdesafio/Models/cep_back4app_model.dart';

class SimulatedCepBack4AppRepository {
  Future<CepBack4AppModel> obterCeps() async {
    // Crie uma instância de CepBack4AppModel com dados simulados
    final simulatedData = CepBack4AppModel([
      Ceps(
        '123',
        'Rua de Exemplo',
        '12345678',
        '2023-10-13T10:00:00',
        '2023-10-13T11:00:00',
        'Bairro Exemplo',
        'Cidade Exemplo',
        'EX',
        '99',
      ),
      // Adicione mais resultados simulados conforme necessário
    ]);

    // Retorne os dados simulados
    return simulatedData;
  }
}