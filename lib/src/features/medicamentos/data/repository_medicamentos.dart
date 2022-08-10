import 'package:lista_de_medicamentos/src/features/medicamentos/domain/entities/medicamento.dart';
import 'package:lista_de_medicamentos/src/features/medicamentos/domain/repository/medicamento_repository.dart';
import 'package:sqflite/sqflite.dart';

class MedicamentosRepository implements IMedicamentoRepository {
  static Future<void> createTables(Database db) async {
    await db.execute('''
          CREATE table IF NOT EXISTS medicamentos(
            id INTERGER PRIMARY KEY autoincrement, 
            nome TEXT not null, 
            descricao INTERGER not null)
          ''');
  }

  static Future<Database> db() async {
    return openDatabase(
      'medicamentos.db',
      version: 1,
      onCreate: (Database database, int version) async {
        await createTables(database);
      },
    );
  }

  @override
  Future<List<Medicamento>> getAllMedicamentos() {
    // TODO: implement getAllMedicamentos
    throw UnimplementedError();
  }

  @override
  Future<void> remove(int id) {
    // TODO: implement remove
    throw UnimplementedError();
  }

  @override
  Future<void> save(Medicamento item) async {
    final db = await MedicamentosRepository.db();
    final data = item.toMap();
    await db.insert(
      'medicamentos',
      data,
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }
}
