import 'package:hm_test_implementation/models/humor_model.dart';

abstract class IHumorRepository {
  Future<List<dynamic>> ObterHumores();
  Future<void> ExcluirHumorById(String id);
  Future<void> InserirHumor(Humor humor);
  Future<void> AtualizarHumor(Humor humor);
}
