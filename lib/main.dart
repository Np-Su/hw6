import 'dart:ui';
import 'guess_number.dart';
import 'package:flutter/material.dart';

import 'game.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  final _controller = TextEditingController();
  var game = Game();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('GUESS THE NUMBER'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0),
        child: Container(
          decoration: BoxDecoration(
              color: Colors.blue.shade100,

              //  border: Border.all(width: 30.0, color: Colors.white),
              borderRadius: BorderRadius.circular(16.0),
              boxShadow: [
                BoxShadow(
                    color: Colors.green,
                    offset: Offset(2.0, 5.0),
                    blurRadius: 5.0,
                    spreadRadius: 2.0)
              ]),
          alignment: Alignment.center,
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                /*Row(
                  children: [
                    Container(
                      width: 50.0,
                      height: 50.0,
                      color: Colors.deepPurple,
                      //child: Text('gg5555555555',textAlign: TextAlign.center,),
                    ),
                  ],
                ),*/
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image.asset('assets/images/guess_logo.png', height: 85, width: 60,),
                      SizedBox(width: 8.0),
                      Column(
                        //mainAxisSize: MainAxisSize.min
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text('GUESS',
                            style:TextStyle(fontSize: 36.0, color: Colors.purple),
                          ),
                          Text('THE NUMBER',
                            style:TextStyle(fontSize: 18.0, color: Colors.green),
                          ),
                        ],
                      ),
                    ],
                   ),
                ),
                //SizedBox(height: 20,),
                //Expanded(child:Container(),),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: TextField(
                   // obscureText: true,
                    textAlign: TextAlign.center,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white.withOpacity(1.0),
                     /* border: OutlineInputBorder(),
                         labelText: 'ทายเลขตั้งแต่ 1 ถึง 100',*/
                      border: OutlineInputBorder(),
                      hintText: 'ทายเลขตั้งแต่ 1 ถึง 100',
                    ),
                    controller: _controller,
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    var input = _controller.text;
                    var inputChangType = int.tryParse(input!);
                  //  print(inputChangType is int);
                    if (inputChangType is int != true) {
                      showDialog( //แจ้งว่ากรอกอักษรแปลก ๆ
                          context: context,
                          barrierDismissible: false, //กดพื้นที่รอบๆ จะไม่ติด
                          builder:(BuildContext context) {
                            return AlertDialog(
                                title: Text('RESULT'),
                                content: Text('กรอกข้อมูลไม่ถูกต้อง ให้กรอกเฉพาะตัวเลขเท่านั้น'),
                                actions:[
                                  ElevatedButton(onPressed: (){
                                    Navigator.of(context).pop();
                                  },
                                      child: Text('OK'))
                                ]
                            );
                          });
                    }else{
                     // print(game.doGuess(inputChangType!));
                      showDialog(
                          context: context,
                          barrierDismissible: false, //กดพื้นที่รอบๆ จะไม่ติด
                          builder:(BuildContext context) {
                            return AlertDialog(
                                title: Text('RESULT'),
                                content: Text(game.doGuess(inputChangType!)),
                                actions:[
                                  ElevatedButton(onPressed: (){
                                    Navigator.of(context).pop();
                                  },
                                      child: Text('OK'))
                                ]
                            );
                          });
                    }
                   /* showDialog(
                      context: context,
                      barrierDismissible: false, //กดพื้นที่รอบๆ จะไม่ติด
                      builder:(BuildContext context) {
                      return AlertDialog(
                        title: Text('RESULT'),
                        content: Text(input),
                        actions:[
                          ElevatedButton(onPressed: (){
                            Navigator.of(context).pop();
                            },
                            child: Text('OK'))
                        ]
                      );
                    });*/
                  },
                  child: Text('GUESS'),
                ),
                SizedBox(height:16.0 ,),
              ],
            ),
        ),
      ),
    );
  }
}
