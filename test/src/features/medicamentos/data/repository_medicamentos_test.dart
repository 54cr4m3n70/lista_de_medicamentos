import 'package:lista_de_medicamentos/src/features/medicamentos/domain/entities/medicamento.dart';
import 'package:lista_de_medicamentos/src/features/medicamentos/domain/repository/medicamento_repository.dart';
import 'package:lista_de_medicamentos/src/features/medicamentos/domain/usecases/medicamento_controller.dart';
import 'package:mockito/mockito.dart';

class MockMedicamentos extends Mock implements IMedicamentoRepository {}

void main() {
  final medicamento = Medicamento(
    id: 1,
    nome: 'Dorflex',
    descricao: 'Dor de Cabeça',
  );

  MedicamentoController medicamentoController;
  MockMedicamentos mockMedicamentos;
}
