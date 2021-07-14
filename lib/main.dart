import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:fluttertoast/fluttertoast.dart';


void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: GpaCalculator(),
  ));
}

class GpaCalculator extends StatefulWidget {
  @override
  _GpaCalculatorState createState() => _GpaCalculatorState();
}

class _GpaCalculatorState extends State<GpaCalculator> {
  String Credit='';
  String Grade='';
  String showgpa='';
  double showresults;
  double results =0, num1=0, num2=0,total_num=0;
  final creditController = TextEditingController();
  final gradeController = TextEditingController();
  final GlobalKey<FormState> GSkey=new GlobalKey<FormState>();
/*
 @override
  void initState() {
    super.initState();
    creditController.addListener(() {
      var num= double.parse(creditController.text.toString());
      print("$num");

    });
    gradeController.addListener(() {
      var nums = double.parse(gradeController.text.toString());
      print("$nums");
    });
  }
*/


  void mul(){
     num1 =double.parse(creditController.text);
     num2=double.parse(gradeController.text);
     results +=(num1*num2);
     total_num +=num1;

    setState(() {
      Credit = "Credit :$num1";
      Grade = "Grade :$num2";
      creditController.clear();
      gradeController.clear();
    });
  }

  void cgpa(){
    showresults=results/total_num;

   setState(() {
     showgpa = "Your Cgpa is : $showresults";
     creditController.clear();
     gradeController.clear();
     Credit='';
     Grade='';

   });
  }

  void cleared(){
    setState(() {
      showgpa='';
      creditController.clear();
      gradeController.clear();
      Credit='';
      Grade='';
      showresults=0;
      results=0;
      num1=0;
      num2=0;
      total_num=0;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cgpa Calculator'),
        centerTitle: true,
      ),
      body:SingleChildScrollView(
      child: Form(
        key: GSkey,
        child:Padding(
            padding: const EdgeInsets.all(20.0),
            child: Center(
              child: Column(
                children: <Widget>[
                 // Text(Credit),
                 // Text(Grade),
                //  Text(showgpa),
                  TextFormField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.blue),
                          borderRadius: BorderRadius.circular(12.0),
                        ),

                        hintText: 'Your Course Credit  ',
                        labelText: "Course Credit",
                        fillColor: Colors.grey[100],
                        filled: true,
                      ),
                        controller: creditController,
                      validator: (String value){
                        if(value.isEmpty){
                          return 'Your Course Credit';
                        }
                        return null;
                      },
                      onSaved: (String value) {
                        Credit = value;
                      }

                  ),
                  SizedBox(
                    height: 10,
                  ),

                  TextFormField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.blue),
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                        hintText: 'Your Course Grade',
                        labelText: "Course Grade",
                        fillColor: Colors.grey[110],
                        filled: true,
                      ),
                      controller: gradeController,
                      validator: (String value){
                        if(value.isEmpty){
                          return 'Your Course Grade';
                        }
                        return null;
                      },
                      onSaved: (String value) {
                        Grade = value;
                      }


                  ),
                  SizedBox(
                    height: 10,
                  ),

                  ElevatedButton(
                      onPressed: ( ) {
                        if (GSkey.currentState.validate()) {
                          mul();
                          Fluttertoast.showToast(msg: "$Credit \n$Grade",
                              toastLength: Toast.LENGTH_SHORT,
                              gravity: ToastGravity.CENTER,textColor: Colors.indigo,backgroundColor: Colors.lightBlueAccent);
                          return;
                        }
                        GSkey.currentState.save();
                        print(Credit);
                        print(Grade);

                      },
                      style: ButtonStyle(
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18.0),
                      side: BorderSide(color: Colors.red)
                           )
                         )
                         ), child: Text('Add Course'),

                     ),
                  SizedBox(
                    height: 10,
                  ),
                  ElevatedButton(

                    onPressed: () {
                    },

                    style: ButtonStyle(
                        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(18.0),
                                side: BorderSide(color: Colors.red)
                            )
                        )
                    ), child: Text(showgpa,
                    style: TextStyle(
                      fontSize: 20.0,
                    ),
                  ),

                  ),

                  SizedBox(
                    height: 10,
                  ),

                  ElevatedButton(
                    onPressed: () {
                      cgpa();
                    },

                    style: ButtonStyle(
                        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(18.0),
                                side: BorderSide(color: Colors.red),
                            )
                        )
                    ), child: Text('Show Your Gpa'),

                  ),
                  SizedBox(
                    height: 10,
                  ),
                  ElevatedButton(

                    onPressed: () {
                      cleared();
                    },

                    style: ButtonStyle(
                        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(18.0),
                                side: BorderSide(color: Colors.red)
                            )
                        )
                    ), child: Text('Clear'),

                  ),

                ],
              ),
            )
        ),
      ),
      ),
    );
  }
}

