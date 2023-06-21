import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BMI Calulator',
      theme: ThemeData(

        primarySwatch: Colors.blue,

      ),
      debugShowCheckedModeBanner: false,
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  var weightController=TextEditingController();
  var FtHeight=TextEditingController();
  var InHeight=TextEditingController();
  var result="";
  var bgColor= Colors.blue.shade50;

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(

        title: Text("BMI Calculator"),
      ),
        body:Container(
          color: bgColor,
          child: Center(
            child: Container(
              width: 300,
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Center(
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Text("Calclate your BMI ",style: TextStyle(
                          fontSize: 35,
                        ),),
                      ),
                    ),
                    SizedBox(height: 20,),
                    TextField(

                      controller:weightController ,

                      keyboardType:TextInputType.number,

                      decoration: InputDecoration(
                        labelText:"Enter Your Weight",
                        prefixIcon: Icon(Icons.account_circle_outlined),
                      ),
                    ),
                    SizedBox(height: 20,),
                    TextField(
                      controller: FtHeight,
                      keyboardType:TextInputType.number,
                      decoration: InputDecoration(
                        labelText: "Enter Your Height in Feets",
                        prefixIcon: Icon(Icons.accessibility_rounded),
                      ),

                    ),
                    SizedBox(height: 20,),
                    TextField(
                      controller: InHeight,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        labelText: "Enter your Height in Inch",
                        prefixIcon: Icon(Icons.accessibility_new_rounded),
                      ),
                    ),
                    SizedBox(height: 20,),
                    ElevatedButton(onPressed: (){
                      var wt=weightController.text.toString();
                      var ft=FtHeight.text.toString();
                      var In=InHeight.text.toString();
                      if(wt !="" && ft!="" && In!=""){
                        // Bmi
                        var iwt=int.parse(wt);
                        var ift=int.parse(ft);
                        var iIn=int.parse(In);

                        var tinch= (12*ift) + iIn;
                        var tCm= tinch*2.54;
                        var tM= tCm/100;
                        var bmi= iwt/(tM*tM);
                        var msg;
                        if(bmi>25){
                        msg="Your Over Weight";
                        bgColor= Colors.red.shade100;
                        }
                        else if(bmi<18){
                          msg="You are under Weight";
                          bgColor=Colors.orange.shade200;
                        }
                        else{
                          msg="You are Healthy";
                          bgColor=Colors.greenAccent.shade100;
                        }
                        ;


                        setState((){
                          bgColor;
                          result="${msg} \n Your BMI is: ${bmi.toStringAsFixed(2)}";
                        });
                      }
                      else{
                        setState((){
                          result="Please Fill all the Required Filleds!";
                        });

                      };

                    }, child:Text("Calculate")),
                    SizedBox(height: 20,),
                    Text(result,style: TextStyle(fontSize: 19),),
                  ],
                ),
              ),
            ),
          ),
        )
    );
  }
}
