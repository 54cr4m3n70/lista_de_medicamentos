import 'package:lista_de_medicamentos/src/features/medicamentos/domain/entities/medicamento.dart';

abstract class IMedicamentoRepository {
  Future<Medicamento> getMedicamento({required int id});
  Future<List<Medicamento>> getAllMedicamentos();
}
