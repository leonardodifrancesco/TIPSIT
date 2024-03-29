// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// **************************************************************************
// FloorGenerator
// **************************************************************************

class $FloorMemoDatabase {
  /// Creates a database builder for a persistent database.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$MemoDatabaseBuilder databaseBuilder(String name) =>
      _$MemoDatabaseBuilder(name);

  /// Creates a database builder for an in memory database.
  /// Information stored in an in memory database disappears when the process is killed.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$MemoDatabaseBuilder inMemoryDatabaseBuilder() =>
      _$MemoDatabaseBuilder(null);
}

class _$MemoDatabaseBuilder {
  _$MemoDatabaseBuilder(this.name);

  final String name;

  final List<Migration> _migrations = [];

  Callback _callback;

  /// Adds migrations to the builder.
  _$MemoDatabaseBuilder addMigrations(List<Migration> migrations) {
    _migrations.addAll(migrations);
    return this;
  }

  /// Adds a database [Callback] to the builder.
  _$MemoDatabaseBuilder addCallback(Callback callback) {
    _callback = callback;
    return this;
  }

  /// Creates the database and initializes it.
  Future<MemoDatabase> build() async {
    final path = name != null
        ? await sqfliteDatabaseFactory.getDatabasePath(name)
        : ':memory:';
    final database = _$MemoDatabase();
    database.database = await database.open(
      path,
      _migrations,
      _callback,
    );
    return database;
  }
}

class _$MemoDatabase extends MemoDatabase {
  _$MemoDatabase([StreamController<String> listener]) {
    changeListener = listener ?? StreamController<String>.broadcast();
  }

  MemoDAO _memoDAOInstance;

  Future<sqflite.Database> open(String path, List<Migration> migrations,
      [Callback callback]) async {
    final databaseOptions = sqflite.OpenDatabaseOptions(
      version: 1,
      onConfigure: (database) async {
        await database.execute('PRAGMA foreign_keys = ON');
      },
      onOpen: (database) async {
        await callback?.onOpen?.call(database);
      },
      onUpgrade: (database, startVersion, endVersion) async {
        await MigrationAdapter.runMigrations(
            database, startVersion, endVersion, migrations);

        await callback?.onUpgrade?.call(database, startVersion, endVersion);
      },
      onCreate: (database, version) async {
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `Memo` (`id` INTEGER PRIMARY KEY AUTOINCREMENT, `titolo` TEXT, `account` TEXT, `categoria` TEXT, `corpo` TEXT, `tag` TEXT)');

        await callback?.onCreate?.call(database, version);
      },
    );
    return sqfliteDatabaseFactory.openDatabase(path, options: databaseOptions);
  }

  @override
  MemoDAO get memoDAO {
    return _memoDAOInstance ??= _$MemoDAO(database, changeListener);
  }
}

class _$MemoDAO extends MemoDAO {
  _$MemoDAO(this.database, this.changeListener)
      : _queryAdapter = QueryAdapter(database, changeListener),
        _memoInsertionAdapter = InsertionAdapter(
            database,
            'Memo',
            (Memo item) => <String, dynamic>{
                  'id': item.id,
                  'titolo': item.titolo,
                  'account': item.account,
                  'categoria': item.categoria,
                  'corpo': item.corpo,
                  'tag': item.tag
                },
            changeListener),
        _memoUpdateAdapter = UpdateAdapter(
            database,
            'Memo',
            ['id'],
            (Memo item) => <String, dynamic>{
                  'id': item.id,
                  'titolo': item.titolo,
                  'account': item.account,
                  'categoria': item.categoria,
                  'corpo': item.corpo,
                  'tag': item.tag
                },
            changeListener),
        _memoDeletionAdapter = DeletionAdapter(
            database,
            'Memo',
            ['id'],
            (Memo item) => <String, dynamic>{
                  'id': item.id,
                  'titolo': item.titolo,
                  'account': item.account,
                  'categoria': item.categoria,
                  'corpo': item.corpo,
                  'tag': item.tag
                },
            changeListener);

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<Memo> _memoInsertionAdapter;

  final UpdateAdapter<Memo> _memoUpdateAdapter;

  final DeletionAdapter<Memo> _memoDeletionAdapter;

  @override
  Future<List<Memo>> getAllMemo() async {
    return _queryAdapter.queryList('SELECT * FROM memo',
        mapper: (Map<String, dynamic> row) => Memo(
            row['id'] as int,
            row['titolo'] as String,
            row['account'] as String,
            row['corpo'] as String,
            row['categoria'] as String,
            row['tag'] as String));
  }

  @override
  Stream<List<Memo>> getMemoByTitolo(String titolo) {
    return _queryAdapter.queryListStream('SELECT * FROM memo WHERE titolo=?',
        arguments: <dynamic>[titolo],
        queryableName: 'Memo',
        isView: false,
        mapper: (Map<String, dynamic> row) => Memo(
            row['id'] as int,
            row['titolo'] as String,
            row['account'] as String,
            row['corpo'] as String,
            row['categoria'] as String,
            row['tag'] as String));
  }

  @override
  Future<Memo> getMemoById(int id) async {
    return _queryAdapter.query('SELECT * FROM memo WHERE id=?',
        arguments: <dynamic>[id],
        mapper: (Map<String, dynamic> row) => Memo(
            row['id'] as int,
            row['titolo'] as String,
            row['account'] as String,
            row['corpo'] as String,
            row['categoria'] as String,
            row['tag'] as String));
  }

  @override
  Future<void> deleteAllMemo() async {
    await _queryAdapter.queryNoReturn('DELETE FROM memo');
  }

  @override
  Future<void> insertMemo(Memo memo) async {
    await _memoInsertionAdapter.insert(memo, OnConflictStrategy.abort);
  }

  @override
  Future<void> updateMemo(Memo memo) async {
    await _memoUpdateAdapter.update(memo, OnConflictStrategy.abort);
  }

  @override
  Future<void> deleteMemo(Memo memo) async {
    await _memoDeletionAdapter.delete(memo);
  }
}
