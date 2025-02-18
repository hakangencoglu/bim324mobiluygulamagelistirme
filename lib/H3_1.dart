import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class H3_1 extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            appBar: AppBar(
              title: Text("İlk Örnek"),
            ),
            body:
            Column(
                children:<Widget>[

                  Text(
                    "Stateless Widget Örneği",
                    style: TextStyle(
                      fontSize: 30,
                      color: Colors.red,
                      fontFamily: 'Times New Roman',
                      fontStyle: FontStyle.italic,
                    ),
                    textAlign: TextAlign.right,
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    child: Text("Düğmeye Tıkla"),
                  ),
                ]
            )

        )
    );
  }
}

