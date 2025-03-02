
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class H4StatelessWidget extends StatelessWidget{
  int a=0;
  @override
  Widget build(BuildContext context){
  return Scaffold(
    body:
    //Container(
    Column(
      children:[
        Text(
        'Stateless widget örneği $a',
        style: TextStyle(
          color: Colors.red,
          fontSize: 30,
          fontFamily: 'Times New Roman'
        ),
      ),
        ElevatedButton(
          onPressed: () {
            a++;
          },
          child: Text('Düğmeye Tıkla'),
        ),
    ]


    ),
  );
}


}