import 'package:lista_de_medicamentos/src/features/medicamentos/domain/entities/medicamento.dart';
import 'package:sqflite/sqflite.dart';

import '../domain/repository/medicamento_repository.dart';

class RepositoryMedicamentos implements IMedicamentoRepository {
  late Database db;

  Future open(String path) async {
    db = await openDatabase(path, version: 1,
        onCreate: (Database db, int version) async {
      await db.execute(
        '''
          CREATE table IF NOT EXISTS medicamentos(
            id INTERGER PRIMARY KEY autoincrement, 
            nome TEXT not null, 
            descricao INTERGER not null)
        ''',
      );
    });
  }

  @override
  Future<List<Medicamento>> getAllMedicamentos() async {
    final List<Map<String, dynamic>> maps = await db.query('medicamentos');

    return List.generate(
      maps.length,
      (i) {
        return Medicamento(
          id: maps[i]['id'],
          descricao: maps[i]['descricao'],
          nome: maps[i]['nome'],
        );
      },
    );
  }

  @override
  Future<void> remove(int id) async {
    await db.delete('medicamentos', where: '$id = ?', whereArgs: [id]);
  }

  @override
  Future<void> save(Medicamento item) async {
    await db.insert('medicamentos', item.toMap());
  }
}
