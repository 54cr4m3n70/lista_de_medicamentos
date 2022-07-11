import 'package:lista_de_medicamentos/src/features/medicamentos/domain/entities/medicamento.dart';

abstract class IMedicamentoRepository {
  Future<List<Medicamento>> getAllMedicamentos();
  Future<void> save(Medicamento item);
  Future<void> remove(int id);
}
