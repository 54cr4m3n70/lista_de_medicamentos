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
  Future<List<Medicamento>> getAllMedicamentos() async {
    final db = await MedicamentosRepository.db();
    final List<Map<String, dynamic>> maps = await db.query('medicamentos');

    return List.generate(
      maps.length,
      (i) => Medicamento(
        id: maps[i]['id'],
        nome: maps[i]['nome'],
        descricao: maps[i]['descricao'],
      ),
    );
  }

  @override
  Future<void> remove(int id) async {
    final db = await MedicamentosRepository.db();

    await db.delete(
      'medicamentos',
      where: 'id = ?',
      whereArgs: [id],
    );
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
