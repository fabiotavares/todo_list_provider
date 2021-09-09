import 'package:sqflite_common/sqlite_api.dart';
import 'package:todo_list_provider/app/core/database/migrations/i_migration.dart';

// exemplo de como faria as migrações

class MigrationV2 implements IMigration {
  @override
  void create(Batch batch) {
    batch.execute('create table teste2(id Integer');
  }

  @override
  void update(Batch batch) {
    batch.execute('create table teste2(id Integer');
  }
}
