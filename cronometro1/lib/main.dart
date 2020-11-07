import 'dart:async';

import 'package:flutter/material.dart';

void main() {
  runApp(Cronometro());
}

class Cronometro extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cronometro',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _TimeKeeperFunction createState() => _TimeKeeperFunction();
}

class _TimeKeeperFunction extends State<MyHomePage> {
  String text = '00:00';
  final _stopWatch = new Stopwatch();
  final time = const Duration(seconds: 1);
  void _start() {
    text = (_stopWatch.elapsed.inMinutes % 60).toString().padLeft(2, '0') +
        ':' +
        (_stopWatch.elapsed.inSeconds % 60).toString().padLeft(2, '0');
    setState(() {});
  }

  void _timer() {
    new Timer(time, _timeKeeperStarted);
  }

  
  void _timeKeeperStarted() {
    if (_stopWatch.isRunning) {
      _timer();
    }
    setState(() {
      _start();
    });
  }


  void _startButton() {
    setState(() {
      if (!_stopWatch.isRunning) {
        _stopWatch.start();
        _timer();
      } 
    });
  }
  void _stopButton(){
    setState(() {
      if(_stopWatch.isRunning){
        _stopWatch.stop();
      }
    });
  }


  void _resetButton() {
    if (_stopWatch.isRunning) {
      _stopButton();
    }
    setState(() {
      _stopWatch.reset();
      _start();
    });
  }

  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(31, 31, 31, 10.0),
         
        appBar: AppBar(
          backgroundColor: Color.fromRGBO(140, 0, 0, 10.0),
          title: Text(
            "Cronometro",
            style: TextStyle(fontSize: 25, color: Color.fromRGBO(255, 255, 255, 10.0)),
          ),
        ),
          
        body: Center (
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              
              Expanded(
                child: FittedBox(
                  fit: BoxFit.none,
                  child: Text(
                    text,
                    style: TextStyle(fontSize: 80, color: Color.fromRGBO(255, 255, 255, 10.0)),), 
                  ),
              ),
              Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [


              FloatingActionButton(
                onPressed: _startButton,
                child: Icon(Icons.play_arrow),
                backgroundColor: Color.fromRGBO(140, 0, 0, 10.0),
                
              ),
              FloatingActionButton(
                child: Text('Reset'),
                onPressed: _resetButton,
                backgroundColor: Color.fromRGBO(140, 0, 0, 10.0),
              ),
              FloatingActionButton(
                child: Icon(Icons.stop),
                onPressed: _stopButton,
                backgroundColor: Color.fromRGBO(140, 0, 0, 10.0),
                
              ),
              
              ]
              ),
              SizedBox(
                height: 50,
                
                ),
              ],
          ),
        ));
        
  }
}
