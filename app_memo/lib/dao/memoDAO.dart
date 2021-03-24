
import 'package:floor/floor.dart';
import 'package:sign_in_flutter/entity/memo.dart';

@dao
abstract class MemoDAO{

  @Query('SELECT * FROM memo')
  Future<List<Memo>> getAllMemo();

  @Query('SELECT * FROM memo WHERE titolo=:titolo')
  Stream<List<Memo>> getMemoByTitolo(String titolo);

  @Query('SELECT * FROM memo WHERE id=:id')
  Future<Memo> getMemoById(int id);

  @Query('DELETE FROM memo')
  Future<void> deleteAllMemo();

  @insert
  Future<void> insertMemo(Memo memo);

  @update
  Future<void> updateMemo(Memo memo);

  @delete
  Future<void> deleteMemo(Memo memo);
}