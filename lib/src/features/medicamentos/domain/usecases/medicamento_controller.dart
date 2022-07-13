import 'package:lista_de_medicamentos/src/features/medicamentos/domain/entities/medicamento.dart';
import 'package:lista_de_medicamentos/src/features/medicamentos/domain/repository/medicamento_repository.dart';
import 'package:lista_de_medicamentos/src/features/medicamentos/infra/repository_medicamentos.dart';

class MedicamentoController {
  final IMedicamentoRepository _db = RepositoryMedicamentos();

  Future<List<Medicamento>> getAllMedicamentos() {
    return _db.getAllMedicamentos();
  }

  Future<void> addMedicamento(Medicamento medicamento) {
    return _db.save(medicamento);
  }

  Future<void> removeMedicamento(int id) {
    return _db.remove(id);
  }
}
