// ignore_for_file: avoid_print
import 'dart:math';
import 'dart:io';

import 'package:flutter/cupertino.dart';
class Game{
  static List<int> myList = [];
  int maxRandom=100;
  static const member =0;
  int? _answer;
  int? _count = 0;

  Game({maxRandom:100}){
    this.maxRandom = maxRandom;
    var r = Random();
    _answer = r.nextInt(maxRandom)+1; //_answer = private package
  }

  String doGuess(int num){
    _count = (_count!+1);
    if(num> _answer!){
      var textReturn = '$num มากเกินไป กรุณาลองใหม่';
      return textReturn;
    }else if(num< _answer!){
      var textReturn = '$num น้อยเกินไป กรุณาลองใหม่';
      return textReturn;
    }else{
      var textReturn = '$num ถูกต้องครับ ยินดีด้วย\n \n คุณทายทั้งหมด $_count ครั้ง';
      return textReturn;
    }
  }

  int? getCount(){
    return _count;
  }
  void playGame(){

    var isCorrect = false;

    print('╔════════════════════════════════════════');
    print('║            GUESS THE NUMBER            ');
    print('╟────────────────────────────────────────');

    do {
      //stdout.write('║ Guess the number between 1 and $maxRandom: ');
      var input = stdin.readLineSync();
      var guess = int.tryParse(input!);
      //if (guess == null) {
        //continue;
      //}

      var result = doGuess(guess!);
      var round = _count;
      if (result == 1) {
        print('║ ➜ $guess is TOO HIGH! ▲');
        print('╟──────────────────────────────────────── $round');
      } else if (result == -1) {
        print('║ ➜ $guess is TOO LOW! ▼');
        print('╟──────────────────────────────────────── $round');
      } else {
        print('║ ➜ $guess is CORRECT ❤, total guesses: $round');
        print('╟────────────────────────────────────────');
        myList.add(round!);
        isCorrect = true;

      }
    } while (!isCorrect);

    print('║                 THE END                ');
    print('╚════════════════════════════════════════');
  }
}
