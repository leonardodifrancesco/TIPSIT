import 'package:floor/floor.dart';
import 'package:sign_in_flutter/entity/memo.dart';

@entity
class Utente {
  @PrimaryKey(autoGenerate : true)
  final String id;
  String nome,cognome, email;
  List<Memo> memos;

  Utente(this.id,this.cognome,this.nome,this.email,this.memos);

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'cognome': cognome,
      'nome': nome,
      'email': email,
      'memos': memos,    
    };
  }

}