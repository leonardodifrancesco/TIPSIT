
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:sign_in_flutter/dao/memoDAO.dart';
import 'package:sign_in_flutter/entity/memo.dart';
import 'package:sign_in_flutter/signIn/login_page.dart';
import 'package:sign_in_flutter/signIn/sign_in.dart';

import 'database.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final database =
      await $FloorMemoDatabase.databaseBuilder('app_database.db').build();
  final dao = database.memoDAO;

  runApp(MyApp(dao: dao));
}

class MyApp extends StatelessWidget {
  final MemoDAO dao;

  MyApp({this.dao});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page', dao: dao),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title, this.dao}) : super(key: key);

  final MemoDAO dao;

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  static int id = 0;
  MemoDatabase database;
  MemoDAO memoDao;
  List<Memo> listaMemo = <Memo>[];

  TextEditingController titoloController = TextEditingController();
  TextEditingController accountController = TextEditingController();
  TextEditingController categoriaController = TextEditingController();
  TextEditingController corpoController = TextEditingController();
  TextEditingController tagController = TextEditingController();

  bool pressed = false;
  //bool pressedInfo=false;
  int idScelto=0;

  void _addMemo() {
    setState(() {
      Memo memo = new Memo(++id, titoloController.text, accountController.text,
          categoriaController.text, corpoController.text, tagController.text);
      memoDao.insertMemo(memo); // update db
      listaMemo.add(memo); // update list
    
      /*await FirebaseFirestore.instance
          .collection('memo')
          .doc(memo.id.toString())
          .set(memo.toMap());

      await FirebaseFirestore.instance
          .collection('users')
          .doc(FirebaseAuth.instance.currentUser.uid)
          .update(
        {
          'memos': FieldValue.arrayUnion(
            [
              memo.id,
            ],
          ),
        },
      );*/
    });
    
  }

//    void condividiMemo() {
    //setState(() async {

     // Memo memo = listaMemo[id]; // update list
    
     // await FirebaseFirestore.instance
         //   .collection('users')
          //  .doc(userIdToShare.first.id)
         //   .update({
        //  'memos': FieldValue.arrayUnion([
        //    id,
        //  ])
     //   });
  //  });
    
//  }

 /* Widget pulsanteAggiungi(){

    return Padding(
        padding: EdgeInsets.all(1),
        child: TextField(
          controller: titoloController,
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            labelText: 'email utente',
          ),
        ),
      );
      
    }*/

  void _deleteAllMemo() {
    memoDao.deleteAllMemo();
    setState(()  {
      listaMemo = <Memo>[];
      id = 0;

      /*await FirebaseFirestore.instance
          .collection('memo')
          .doc(listaMemo.toString())
          .delete();

      await FirebaseFirestore.instance
          .collection('users')
          .doc(FirebaseAuth.instance.currentUser.uid)
          .update(
        {
          'memos': FieldValue.arrayRemove(
            [listaMemo.toString()],
          ),
        },
      );*/
    });
  }



  @override
  void initState() {
    super.initState();
    $FloorMemoDatabase.databaseBuilder('app_database.db').build().then((db) => {
          db.memoDAO.getAllMemo().then((ps) => setState(() {
                database = db;
                memoDao = db.memoDAO;
                listaMemo = ps;
              }))
        });
  }

  Widget form() {
    return Column(children: <Widget>[
      Padding(
        padding: EdgeInsets.all(1),
        child: TextField(
          controller: titoloController,
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            labelText: 'Titolo Memo',
          ),
        ),
      ),
      Padding(
        padding: EdgeInsets.all(1),
        child: TextField(
          controller: accountController,
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            labelText: 'Account Google',
          ),
        ),
      ),
      Padding(
        padding: EdgeInsets.all(1),
        child: TextField(
          controller: categoriaController,
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            labelText: 'Categoria Memo',
          ),
        ),
      ),
      Padding(
        padding: EdgeInsets.all(1),
        child: TextField(
          controller: corpoController,
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            labelText: 'Contenuto Memo',
          ),
        ),
      ),
      Padding(
        padding: EdgeInsets.all(1),
        child: TextField(
          controller: tagController,
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            labelText: 'Tag',
          ),
        ),
      ),

      FloatingActionButton(
            child: Icon(Icons.add),
            backgroundColor: Colors.orangeAccent,
            onPressed: () {
              _addMemo();
            },
          ),
    ]);
  }

  Future<Widget> mostraMemo(int id) async{

    Future<Memo> memoFuturo;

    $FloorMemoDatabase.databaseBuilder('database.db').build().then((db) => {
          memoFuturo=db.memoDAO.getMemoById(id)
        });

    Memo memo= await memoFuturo;

    return Column(children: <Widget>[
      Padding(
        padding: EdgeInsets.all(20),
        child: TextField(
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            labelText: memo.titolo + memo.tag,
          ),
        ),
      ),

      Padding(
        padding: EdgeInsets.all(20),
        child: TextField(
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            labelText: memo.corpo,
          ),
        ),
      ),

    ]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('appMemo'),
        ),
        body: 
        Container(
          decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [Colors.blue[100], Colors.blue[400]],
            ),
          ),
          child:Column(

           mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              CircleAvatar(
                backgroundImage: NetworkImage(
                  imageUrl,
                ),
                radius: 60,
                backgroundColor: Colors.transparent,
              ),
              SizedBox(height: 40),
              Text(
                'NAME',
                style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: Colors.black54),
              ),
              Text(
                name,
                style: TextStyle(
                    fontSize: 25,
                    color: Colors.deepPurple,
                    fontWeight: FontWeight.bold),
              ),
              
              SizedBox(height: 20),

              RaisedButton(
                onPressed: () {
                  signOutGoogle();
                  Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) {return LoginPage();}), ModalRoute.withName('/'));
                },
                color: Colors.deepPurple,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Sign Out',
                    style: TextStyle(fontSize: 25, color: Colors.white),
                  ),
                ),
                elevation: 5,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(40)),
              ) ,

          pressed ? form() : SizedBox(),
          RaisedButton(
            child: Text("mostra form"),
            onPressed: () {
                setState(() {
                  pressed = true;
                });

            },
          ),

      /*    RaisedButton(
            child: Text('condividi memo'),
            onPressed: () {
              condividiMemo();
            },
          ),*/
          
          RaisedButton(
            child: Text('add memo'),
            onPressed: () {
              _addMemo();
            },
          ),
              
          RaisedButton(
            child: Text('delete db'),
            onPressed: () {
            _deleteAllMemo();
            },
          ),
                        Expanded(
                            child: ListView.builder(
                                padding: const EdgeInsets.all(8),
                                itemCount: listaMemo.length,
                                itemBuilder: (BuildContext context, int index) {
                                  return Container(
                                    height: 50,
                                    margin: EdgeInsets.all(2),
                                    color: Colors.red[100],
                                    child: Center(
                                        child: Text(
                                      '${listaMemo[index].id}: ${listaMemo[index].titolo}',
                                      style: TextStyle(fontSize: 18),
                                    )),
                                  );
                                }))
                      ])));
                }
}
