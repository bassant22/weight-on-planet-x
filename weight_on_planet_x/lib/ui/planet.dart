import 'package:flutter/material.dart';

class Planet extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new PlanetX();
  }
}
/*
pluto :0.06;
veuns :091;
Marse:0.38;
 */
class PlanetX extends State<Planet> {
  final TextEditingController _weight =new TextEditingController();
  int radioValue=0;
  double _finalResult=0.0;
  String _final;

  void _handledRadioChanged(int value)
  {
    setState(() {
      radioValue=value;
      print("the value of Radio Button is : $radioValue");

     switch (radioValue)
      {
        case 0:
          _finalResult= calculateWeight(_weight.text,0.06);
          _final="your weight in Pluto is ${_finalResult.toStringAsFixed(1)} bls";
          break;
          case 1:
            _finalResult=calculateWeight(_weight.text,0.38);
            _final="your weight in Marse is ${_finalResult.toStringAsFixed(1)}  bls";

            break;
        case 2:
           _finalResult=calculateWeight(_weight.text,0.91);
           _final="your weight in Veuns is ${_finalResult.toStringAsFixed(1)}  bls";

     }

    });

  }
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: Color(0xff104986),
      appBar: new AppBar(
        backgroundColor: Color(0xff104986),
        title: new Center(
          child: Text("Weight on the planet X"),
        ),
      ),
      body: new Container(
        child: new ListView(
          padding: EdgeInsets.all(10.0),
          children: <Widget>[
            new Center(
              child: new Image.asset(
                'images/p2.jpg',
                width: 400.0,
                height: 200.0,
              ),
            ),
            new Container(
              margin: EdgeInsets.all(5.0),
              child: Column(
                children: <Widget>[
                  new TextField(
                    style: TextStyle(color:Colors.white),
                    controller: _weight,
                    keyboardType: TextInputType.number,
                    decoration: new InputDecoration(
                      labelText: "your Weight on earth",
                      hintText: "on pounds",
                      icon: Icon(Icons.person_outline,color: Colors.white,),
                    ),
                  ),
                  new Padding(padding: EdgeInsets.all(5.0),),
                new Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                  new Radio<int>(activeColor:Colors.lime,value: 0, groupValue: radioValue, onChanged: _handledRadioChanged ),
                  new Text("Pluto",style: TextStyle(color: Colors.white),),
                  new Radio<int>(activeColor:Colors.lime,value: 1, groupValue: radioValue, onChanged: _handledRadioChanged),
                  new Text("Marse",style: TextStyle(color: Colors.white),),
                  new Radio<int>(activeColor:Colors.lime,value: 2, groupValue: radioValue, onChanged: _handledRadioChanged),
                  new Text("Venus",style: TextStyle(color: Colors.white),),
                  ],
                ),
                  new Padding(padding: EdgeInsets.all(15.0),),
                  new Text("$_final",style: TextStyle(color: Colors.white),),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

 double calculateWeight(String userWeight, double multi) {

    if (int.parse(userWeight).toString().isNotEmpty && int.parse(userWeight)>0)
        return int.parse(userWeight)*multi;
    else {
      print('Wrong');
      return int.parse('180') * multi;
    }

  }
}


