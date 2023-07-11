import 'dart:convert';
import 'package:hm_test_implementation/models/humor_model.dart';
import 'package:hm_test_implementation/repositories/Humor/IHumor_repository.dart';
import 'package:http/http.dart' as http;

class HumorRepository implements IHumorRepository {
  @override
  Future<void> AtualizarHumor(Humor humor) {
    // TODO: implement AtualizarHumor
    throw UnimplementedError();
  }

  @override
  Future<void> ExcluirHumorById(String id) {
    // TODO: implement ExcluirHumorById
    throw UnimplementedError();
  }

  @override
  Future<void> InserirHumor(Humor humor) {
    // TODO: implement InserirHumor
    throw UnimplementedError();
  }

  @override
  Future<List<dynamic>> ObterHumores() async {
    const urlBase = 'https://10.0.2.2:7053/api/Humor';
    const header = {'accept': 'text/plain'};

    final response = await http.get(Uri.parse(urlBase), headers: header);

    if (response.statusCode == 200) {
      final json = jsonDecode(response.body);

      return json;

      // for (Map<String, dynamic> humor in json) {
      //   Humor hum = Humor(
      //       id: humor['id'],
      //       titulo: humor['tituloHumor'],
      //       descricao: humor['descricaoHumor'],
      //       permiteVisualizacao: humor['permiteVisualizacao'],
      //       tipoHumor: humor['tipoDoHumor'],
      //       dataInclusao: humor['dataInclusao'],
      //       dataAlteracao: humor['dataInclusao']);

      //   humores.insert(0, hum);
      // }
      //return humores;
    }
    return [];
  }
}
