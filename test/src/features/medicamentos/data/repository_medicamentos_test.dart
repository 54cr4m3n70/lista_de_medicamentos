import 'package:flutter_test/flutter_test.dart';
import 'package:lista_de_medicamentos/src/features/medicamentos/data/repository_medicamentos.dart';
import 'package:mockito/mockito.dart';
import 'package:sqflite/sqflite.dart';

class MockDatabase extends Mock implements Database {}

void main() {
  RepositoryMedicamentos repositoryMedicamentos;
  MockDatabase mockDatabase;

  setUp(() {
    mockDatabase = MockDatabase();
    repositoryMedicamentos = RepositoryMedicamentos();
  });
}
