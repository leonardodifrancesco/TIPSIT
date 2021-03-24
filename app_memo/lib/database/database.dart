
import 'dart:async';


import 'package:floor/floor.dart';
import 'package:sign_in_flutter/dao/memoDAO.dart';
import 'package:sign_in_flutter/entity/memo.dart';
import 'package:sqflite/sqflite.dart' as sqflite;

part 'database.g.dart';

@Database(version:1, entities:[Memo])
abstract class MemoDatabase extends FloorDatabase{

  MemoDAO get memoDAO;

}