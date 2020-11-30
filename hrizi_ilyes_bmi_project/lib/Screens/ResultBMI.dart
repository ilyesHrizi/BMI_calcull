import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hrizi_ilyes_bmi_project/Controllers/BMIControllers.dart';

class ResultBMI extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(home: ResultBMIView());
  }

}

class ResultBMIView  extends StatefulWidget{
  @override
  _ResultBMIView createState() => _ResultBMIView();

}

class _ResultBMIView extends State<ResultBMIView> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Expanded(
              flex: 1,
              child: Container(
                padding: EdgeInsets.all(15.0),
                alignment: Alignment.center,
                child: Text(
                   "Your Result : ${Get.find<BMIControllers>().getname()}",
                    style: TextStyle(
                      fontSize: 25.0,
                      fontWeight: FontWeight.bold,
                    )
                ),
              ),
            ),
            Expanded(
              flex: 5,
              child: Container(
                  margin: EdgeInsets.all(10.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    color: Colors.grey,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[

                      Text(
                        "BMI Result : ${Get.find<BMIControllers>().ResultBMI()}",
                        style: TextStyle(
                            fontSize: 50.0, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 20),
                      Text(
                        "${Get.find<BMIControllers>().getResult()}",
                        style: TextStyle(
                          color: Color(0xFF24D876),
                          fontSize: 40.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 20),

                      Text(
                        ": ${Get.find<BMIControllers>().getInterpreta()}",
                        style: TextStyle(
                          fontSize: 20.0,
                        ),
                      ),
                      SizedBox(height: 20),

                      Buttonbar(),
                    ],
                  )
              ),
            ),


          ],
        ),
      ),

    );
  }

  Buttonbar() {
    return Center(
      child: RaisedButton(
        onPressed: () {
          Get.toNamed('/BMIValueInput');
        },
        textColor: Colors.white,
        padding: const EdgeInsets.all(0.0),
        child: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: <Color>[
                Color(0xFF0D47A1),
                Color(0xFF1976D2),
                Color(0xFF42A5F5),
              ],
            ),
          ),
          padding: const EdgeInsets.all(10.0),
          child:
          const Text('Re-Caluculate', style: TextStyle(fontSize: 20)),
        ),
      ),
    );
  }
}