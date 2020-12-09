import 'dart:io';
import 'package:flutter/material.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Chat',
      theme: ThemeData(
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Chat'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // lista dei messaggi
  List<String> _messages = [];

  TextEditingController _controller = TextEditingController();

  // socket che usiamo per ascoltare e inviare nuovi messaggi
  Socket _socket;

  @override
  void initState() {
    super.initState();

    // connessione al socket soltanto la prima volta che si apre la pagina
    Socket.connect('10.0.2.2', 3000).then((remoteSocket) {
      setState(() {
        _socket = remoteSocket;
        _socket.listen(
          dataHandler,
          onError: errorHandler,
          onDone: doneHandler,
          cancelOnError: false,
        );
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: Container(
              child: Container(
                child: Column(
                  children: [
                    ListView.builder(
                      shrinkWrap: true,
                      itemCount: _messages.length,
                      itemBuilder: (BuildContext context, int index) {
                        final message = _messages[index];
                        return Column(
                          children: [
                            Container(
                              child: Text(message),
                            ),
                          ],
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
          Container(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: TextField(
                    textCapitalization: TextCapitalization.sentences,
                    controller: _controller,
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.send),
                  iconSize: 25.0,
                  onPressed: _sendMessage,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _sendMessage() {
    final text = _controller.text;

    _socket.write(text);
    setState(() {
      _messages.add(text);
    });
  }

  void dataHandler(data) {
    final message = String.fromCharCodes(data).trim();
    print(message);

    setState(() {
      _messages.add(message);
    });
  }

  void errorHandler(error, StackTrace trace) {
    print(error);
  }

  void doneHandler() {
    _socket.destroy();
  }

  @override
  void dispose() {
    _socket.destroy();
    super.dispose();
  }
}
