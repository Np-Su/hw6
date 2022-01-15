// ignore_for_file: avoid_print

import 'dart:io';
import 'dart:math';

import 'game.dart';
check(inputMaximun){
  var game ;
  if(inputMaximun!=null){
    game = Game(maxRandom:num.parse(inputMaximun));
    game.playGame();
  }else{
    game = Game();
    game.playGame();
  }
}
void main() {
  stdout.write('Enter a maximum number to random : ');
  var inputMaximun = stdin.readLineSync();
  check(inputMaximun);
  while(true){
    stdout.write('Play again? (Y/N):');
    var inputFinish = stdin.readLineSync();
    if(inputFinish == 'Y' || inputFinish == 'y'){
      stdout.write('Enter a maximum number to random : ');
      var inputMaximunAgain = stdin.readLineSync();
      check(inputMaximunAgain);
    }else if(inputFinish == 'N' || inputFinish == 'n'){
      var allPlay = Game.myList.length;
      print("You've played $allPlay games");
      for (var i = 0; i < allPlay; i++) {
        var numList = Game.myList[i];
        print("Games #$i: $numList guesses");
      }
      break;
    }
  }
}

