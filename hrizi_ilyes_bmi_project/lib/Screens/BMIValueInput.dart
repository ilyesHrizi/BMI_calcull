import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:hrizi_ilyes_bmi_project/Controllers/BMIControllers.dart';
import 'package:hrizi_ilyes_bmi_project/Controllers/SumBinding/MySumBinding.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

enum Gender {
  Male,
  Female,
}
class BMIValueInput extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
return MaterialApp(home: BMIValueInputView());
  }

}

class BMIValueInputView  extends StatefulWidget{
  @override
  _BMIValueInputStateView createState() => _BMIValueInputStateView();

}

class _BMIValueInputStateView extends State<BMIValueInputView>{
  int height = 180;
  double minHeight = 120;
  double maxHeight = 220;

  var female = FontAwesomeIcons.venus;
  var male = FontAwesomeIcons.mars;
  int weight = 60;
  int age = 28;
  final myController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // this is my First page for the application
    return
        Scaffold(
          body: Center(
            child: Container(
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topRight,
                      end: Alignment.bottomLeft,
                      colors: [Colors.pink, Colors.purpleAccent])),
              padding: EdgeInsets.all( 30.0),

              child: SizedBox(
                child: Center(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children:<Widget> [
                    InputTextItem(),

                    Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        mainAxisAlignment: MainAxisAlignment.center,                    children: [

                          Gender("Male",male),
                          SizedBox(width: 25),
                          Gender("Female",female),

                        ],
                      ),

                     Height(),

                      SlidebarF(),
                      Center(
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Column  (
                               children: [
                                 Column  (

                          children: [
                            VariableInput(),
                            SizedBox(height: 20),

                            Row(
                              children: [
                                ButtonAddandless(),
                                Buttonless()

                              ],
                            ),


                                      ],
                                    ),
                                  ],
                              ),
                      SizedBox(width: 70),

                                  Column  (
                                    children: [
                                      VariableInputAge(),
                                      SizedBox(height: 20),

                                      Row(
                                        children: [
                                          ButtonAddAge(),
                                          ButtonlessAge()
                                        ],
                                      ),


                                    ],
                        ),
                                ],


             ),
                      ),
                    SizedBox(height: 25),

                    Buttonbar(),

                    ],
                  ),
                ),
              ),
            ),
          ),
        );
  }
Gender(String Sexe,IconData icons)
{
  var isGenderSelected = true;
  return
    SizedBox.fromSize(
      size: Size(150, 150), // button width and height
      child: ClipOval(
        child: Material(
          color:Colors.blueGrey, // splash color
            // button color
          child: InkWell(
            splashColor:  isGenderSelected ? Colors.greenAccent : Colors.black, // splash color
            onTap: () {
        isGenderSelected = !isGenderSelected;

              if(Sexe == "Male")
              {
                Get.find<BMIControllers>().male();

              }
              else if(Sexe == "Female")
              {
                Get.find<BMIControllers>().female();

              }
            },
// button pressed
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Icon(icons,
                size: 90.0,
                color: Colors.white),
            SizedBox(

                  height: 20.0,

                ),// icon
                Text(Sexe ,
                  style: TextStyle(

                    fontSize: 20.0,

                    color: Colors.white,

                  )), // text
              ],
            ),
          ),

        ),
      ),
    );
}

ButtonAddandless()
{
 return RawMaterialButton(
    child: Icon(FontAwesomeIcons.plus ,color: Colors.white),

    constraints: BoxConstraints.tightFor(
      width: 50.0,
      height: 50.0,
    ),
    elevation: 6.0,
    shape: CircleBorder(),
    fillColor: Colors.pinkAccent,
    onPressed: (){
      GetStorage box = GetStorage();

   Get.find<BMIControllers>().incrementW();

    },
  );
}
  Buttonless()
  {
    return RawMaterialButton(
      child: Icon(FontAwesomeIcons.minus,color: Colors.white),
      constraints: BoxConstraints.tightFor(
        width: 56.0,
        height: 56.0,
      ),
      elevation: 6.0,
      shape: CircleBorder(),
      fillColor: Colors.pink,
      onPressed: (){
        GetStorage box = GetStorage();

        Get.find<BMIControllers>().decrementW();

      },
    );
  }
  ButtonAddAge()
  {
    return RawMaterialButton(
      child: Icon(FontAwesomeIcons.plus,color: Colors.white),
      constraints: BoxConstraints.tightFor(
        width: 56.0,
        height: 56.0,
      ),
      elevation: 6.0,
      shape: CircleBorder(),
      fillColor: Colors.pink,
      onPressed: (){
        GetStorage box = GetStorage();

        Get.find<BMIControllers>().incrementA();

      },
    );
  }
  ButtonlessAge()
  {
    return RawMaterialButton(
      child: Icon(FontAwesomeIcons.minus ,color: Colors.white,),
      constraints: BoxConstraints.tightFor(
        width: 56.0,
        height: 56.0,
      ),
      elevation: 6.0,
      shape: CircleBorder(),
      fillColor: Colors.pink,
      onPressed: (){
        GetStorage box = GetStorage();

        Get.find<BMIControllers>().decrementA();

      },
    );
  }
Height()
{
  return Container(
    margin: EdgeInsets.all(15.0),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(10.0),
      color:Colors.black54,
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.baseline,
      textBaseline: TextBaseline.alphabetic,

      children: <Widget>[
        Text(
          height.toString(),
          style: TextStyle(fontSize: 30.0, fontWeight: FontWeight.w900,color: Colors.white)

          ,
        ),

        Text(
          'cm',
          style: TextStyle(
            fontSize: 20.0,
            color: Color(0xFF8D8E98),
          ),
        ),
      ],
    ),
  );
}
SlidebarF(){
    return

        SliderTheme(
          data: SliderTheme.of(context).copyWith(
            activeTrackColor: Colors.white,
            inactiveTrackColor: Color(0xFF8D8E98),
            thumbColor: Color(0xFFEB1555),
            overlayColor: Color(0x29EB1555),
            thumbShape:
            RoundSliderThumbShape(enabledThumbRadius: 15.0),
            overlayShape:
            RoundSliderOverlayShape(overlayRadius: 30.0),
          ),
          child: Slider(
            value: height.toDouble(),
            min: minHeight,

            max: maxHeight,
            onChanged: (double newValue) {
              setState(() {
                height = newValue.round();
                Get.find<BMIControllers>().calculateBMI(height);
              });
            },
          ),
        );
}
Buttonbar()
{
 return Center(
   child: RaisedButton(
     onPressed: () {
       Get.toNamed('/ResultBMI');

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
       const Text('Caluculate BMI', style: TextStyle(fontSize: 20)),
     ),
   ),
 );

}
VariableInput()
{
  return GetX<BMIControllers>(
    //You can use bindings instead of init. Bindings are when this widget gets
    //rendered, you can create your Controller
    builder: (_) {
      return SizedBox(
        child: Container(

          child: Column(
            children: [
              Text(
                'Weight :',
                style: TextStyle(fontWeight: FontWeight.bold,fontSize: 24.0 , color: Colors.white),
              ),
              SizedBox(height : 25),

              Text(
                '    ${_.weight.value}',
                style: TextStyle(fontWeight: FontWeight.bold,fontSize: 24.0 , color: Colors.white),
              ),

            ],
          ),
        ),
      );
    },
  );
}
  VariableInputAge()
  {
    return GetX<BMIControllers>(
      //You can use bindings instead of init. Bindings are when this widget gets
      //rendered, you can create your Controller
      builder: (_) {
        print("count1 rebuild");
        return SizedBox(
          child: Column(
            children: [
              Text(
                ' Age : ',
                style: TextStyle(fontWeight: FontWeight.bold , fontSize: 24.0 , color: Colors.white),
              ),
              SizedBox(height: 25),

              Text(
                '   ${_.age.value}',
                style: TextStyle(fontWeight: FontWeight.bold , fontSize: 24.0 , color: Colors.white),
              ),
            ],
          ),
        );
      },
    );
  }
  GenderCheck()
  {
  return  GestureDetector(
    onTap: (){

    },
      child: Container(

        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[

          ],
        ),
        margin: EdgeInsets.all(15.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          color: Colors.purple,
        ),
      ),

    );
  }
  InputTextItem()
  {
    return Padding(
      padding: const EdgeInsets.all(19.0),
      child: Center(
        child: Column(
          children: [
            TextFormField(
              controller: myController,

              decoration: InputDecoration(
                prefixIcon : Icon(FontAwesomeIcons.user),

                filled: true,
                fillColor: Colors.white,
                contentPadding: const EdgeInsets.only(
                    left: 50.0, bottom: 8.0, top: 8.0),
                focusedBorder: OutlineInputBorder(
                  borderSide: new BorderSide(color: Colors.white),
                  borderRadius: new BorderRadius.circular(25.7),
                ),
                enabledBorder: UnderlineInputBorder(
                  borderSide: new BorderSide(color: Colors.white),
                  borderRadius: new BorderRadius.circular(25.7),
                ),
              ),

            ),
            RaisedButton(
                child:
                const Text('Send', style: TextStyle(fontSize: 20)),
                onPressed:(){
                  if (myController.text.isEmpty) {
                    Get.snackbar(
                      " incorrect",
                      "Write your name",
                      backgroundColor: Colors.red,
                      snackPosition: SnackPosition.BOTTOM,
                    );
                  }
              Get.find<BMIControllers>().getName(myController.text.toString());

            })
          ],
        ),

      ),
    );
  }
}