import 'package:flutter_test/flutter_test.dart';
import 'package:lista_de_medicamentos/src/features/medicamentos/domain/repository/medicamento_repository.dart';
import 'package:lista_de_medicamentos/src/features/medicamentos/domain/usecases/medicamento_controller.dart';
import 'package:mockito/mockito.dart';

class MockMedicamentos extends Mock implements IMedicamentoRepository {}

void main() {
  MedicamentoController medicamentoController;
  MockMedicamentos mockMedicamentos;

  setUp(() {
    mockMedicamentos = MockMedicamentos();
    medicamentoController = MedicamentoController(
      medicamentoRepository: mockMedicamentos,
    );
  });
}
