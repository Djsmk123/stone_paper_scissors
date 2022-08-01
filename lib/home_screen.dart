import 'dart:math';

import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:flutter_bounce/flutter_bounce.dart';
import 'components/userlabel.dart';
import 'constant.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int cpuScore=0;
  int userScore=0;
  String  msg="";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundClr,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children:  [
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text("Stone Paper Scissors",style: TextStyle(
                  color:Colors.white,
                  fontSize: 30
              ),),
            ),
            const SizedBox(height: 100,),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const UsersLabel(title: 'User',),
                  Text("$userScore:$cpuScore",style:const TextStyle(
                      color: Colors.white,
                      fontSize: 50
                  ),),
                  const UsersLabel(title: 'Comp',),
                ],
              ),
            ),
            const SizedBox(height: 100,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                buildFlexible(Moves.paper,"paper.png"),
                buildFlexible(Moves.scissors,"scissors.png"),
                buildFlexible(Moves.rock,"stone.png"),
              ],
            ),

            Padding(
              padding: const EdgeInsets.symmetric(vertical: 30,horizontal: 30),
              child: Text(msg,
                textAlign: TextAlign.center,
                style: const TextStyle(color: Colors.white,fontSize: 20),),
            ),

            const Padding(
              padding: EdgeInsets.symmetric(vertical: 20),
              child: Text("Make your move.",style: TextStyle(color: Colors.white,fontSize: 30),),
            ),

          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.redAccent,
        onPressed: () {
          setState((){
            cpuScore=0;
            userScore=0;
            msg="";
          });
        },
        child: Icon(Icons.refresh),

      ),
    );
  }

  Flexible buildFlexible(Moves moves,img) {
    return Flexible(child: Bounce(
        onPressed: ()=>makeMove(moves),
        duration: const Duration(milliseconds: 200),
        child: Column(
          children: [
            Image.asset("images/$img"),
            const SizedBox(height: 10,),
            Text(capitalizeFirst(moves.name),style: const TextStyle(
                color: Colors.white,
                fontSize: 20
            ),)
          ],
        )));
  }
  void makeMove(Moves tmpUserMove)  {
    //generate random number of cpu
    var random=Random().nextInt(2)+1;
    var tmpCpuMove=random==1?Moves.rock:(random==2?Moves.paper:Moves.scissors);
    //cases where user will win
    if((tmpUserMove==Moves.rock && tmpCpuMove==Moves.scissors) ||(tmpUserMove==Moves.paper && tmpCpuMove==Moves.rock) ||((tmpUserMove==Moves.scissors && tmpCpuMove==Moves.paper)))
    {

      setState((){
        msg="${capitalizeFirst(tmpUserMove.name)} beats ${capitalizeFirst(tmpCpuMove.name)}. You WINNN!!! ✌ for now.";
        userScore++;
      });
    }
    else if((tmpUserMove==Moves.paper && tmpCpuMove==Moves.scissors) ||(tmpUserMove==Moves.rock && tmpCpuMove==Moves.paper) ||((tmpUserMove==Moves.scissors && tmpCpuMove==Moves.rock)))
    {

      setState((){
        msg= "${capitalizeFirst(tmpUserMove.name)} is vanquished by ${capitalizeFirst(tmpCpuMove.name)}.\n🤮 Soz, you LOSE."; ;
        cpuScore++;
      });
    }
    else{
      setState((){
        msg="${capitalizeFirst(tmpUserMove.name)} does nothing to ${capitalizeFirst(tmpCpuMove.name)}. They are friends. Everybody loses / go home.";
      });
    }


  }

  String capitalizeFirst(String str){
    return str[0].toUpperCase()+str.substring(1);
  }
}