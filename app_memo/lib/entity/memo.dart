import 'package:floor/floor.dart';

@entity
class Memo {
  @PrimaryKey(autoGenerate : true)
  final int id;
  String titolo, account, categoria, corpo, tag;

  Memo(this.id,this.titolo,this.account,this.corpo, this.categoria,this.tag);

  Map<String, dynamic> toMap() {
    return {
      'tag': tag,
      'account': account,
      'categoria': categoria,
      'corpo': corpo,
      'id': id,
      'titolo': titolo,     
    };
  }

}