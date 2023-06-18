// import 'dart:html';

import 'package:flutter/material.dart';

void main(){
  runApp(myapp());
}
class myapp extends StatelessWidget {
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      title: 'hello Worlds',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
  home: Dashboard(),
    );
  }
}

class Dashboard extends StatefulWidget {

  @override
  State<Dashboard> createState(){
    return _Dashboard();


  }
}

class _Dashboard extends State<Dashboard>{

  // var no1controller = TextEditingController();
  var no2controller = TextEditingController();
  TextEditingController no1controller = TextEditingController();
  var DisplayResult;
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: 100,
              // color: Colors.green,
              child: Text("My First Calculator App",style: TextStyle(fontSize: 30),),
            ),
            TextField(
              controller: no1controller,
              keyboardType: TextInputType.number,

            ),
            TextField(
              controller:no2controller,
              keyboardType: TextInputType.number,
            ),Padding(
              padding: const EdgeInsets.fromLTRB(20, 10, 0, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(onPressed: (){
                    var no1 = int.parse(no1controller.text.toString());
                    var no2 = int.parse(no2controller.text.toString());

                    var sum=no1+no2;
                    DisplayResult= "The Sum of $no1 + $no2 is $sum ";
                    setState(() {});

                  }, child: Text("Add")),
                  ElevatedButton(onPressed: (){
                    var no1 = int.parse(no1controller.text.toString());
                    var no2 = int.parse(no2controller.text.toString());

                    var sum=no1-no2;
                    DisplayResult= "The Sum of $no1 - $no2 is $sum ";
                    setState(() {});

                  }, child:Text("Sub")),
                  ElevatedButton(onPressed: (){
                    var no1=int.parse(no1controller.text.toString());
                    var no2=int.parse(no2controller.text.toString());
                    var sum= no1*no2;
                 DisplayResult =" the sum of $no1 * $no2 is $sum";
                    setState(() {});
                  }, child: Text("Multi")),
                  ElevatedButton(onPressed: (){
                    var no1 = int.parse(no1controller.text.toString());
                    var no2 = int.parse(no2controller.text.toString());

                    var sum=no1/no2;
                    DisplayResult= "The Sum of $no1 /  $no2 is $sum ";
                    setState(() {});
                  }, child: Text("Divide")),
                ],
              ),
            ),
            Container(height: 19,),
            Text("Result: $DisplayResult ", style: TextStyle(fontSize: 17),)
          ],
        ),
      )
    );
  }



}