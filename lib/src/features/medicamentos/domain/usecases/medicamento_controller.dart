import 'package:lista_de_medicamentos/src/features/medicamentos/domain/entities/medicamento.dart';
import 'package:lista_de_medicamentos/src/features/medicamentos/domain/repository/medicamento_repository.dart';

class MedicamentoController {
  IMedicamentoRepository medicamentoRepository;

  MedicamentoController({
    required this.medicamentoRepository,
  });

  Future<List<Medicamento>> getAllMedicamentos() {
    return medicamentoRepository.getAllMedicamentos();
  }

  Future<void> addMedicamento(Medicamento medicamento) {
    return medicamentoRepository.save(medicamento);
  }

  Future<void> removeMedicamento(int id) {
    return medicamentoRepository.remove(id);
  }
}
